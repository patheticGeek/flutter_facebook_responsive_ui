import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          floating: true,
          centerTitle: false,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'flutter',
            style: TextStyle(
              fontSize: 28.0,
              letterSpacing: -1.2,
              fontWeight: FontWeight.bold,
              color: Palette.facebookBlue,
            ),
          ),
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () {},
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () {},
            )
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverToBoxAdapter(
          child: Stories(
            currentUser: currentUser,
            stories: stories,
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

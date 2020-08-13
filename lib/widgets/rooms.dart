import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms({Key key, @required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CreateRoomButton(),
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ProfileAvatar(
                imageUrl: onlineUsers[index - 1].imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.blue,
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 2.0,
      ),
      child: Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (bounds) =>
          //       Palette.createRoomGradient.createShader(bounds),
          //   child: Icon(Icons.video_call, color: Colors.white, size: 35.0),
          // ),
          Icon(Icons.video_call, color: Colors.purple, size: 35.0),
          const SizedBox(width: 4.0),
          Text('Create\nRoom', style: TextStyle(color: Colors.blue))
        ],
      ),
    );
  }
}

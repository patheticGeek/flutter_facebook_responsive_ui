import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottonIndicator;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isBottonIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    size: 28.0,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                  ),
                ),
              ))
          .values
          .toList(),
      indicator: BoxDecoration(
        border: isBottonIndicator
            ? Border(
                bottom: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              )
            : Border(
                top: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              ),
      ),
    );
  }
}

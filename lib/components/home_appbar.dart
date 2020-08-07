import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget actionButton;

  const MyAppBar({this.title, this.actionButton});
  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      color: Colors.black12,
      actions: <Widget>[actionButton],
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}

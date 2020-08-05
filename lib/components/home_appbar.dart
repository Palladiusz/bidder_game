import 'package:bidder_game/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_right,
            size: 50.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryScreen(),
              ),
            );
          },
          tooltip: 'Move to history screen',
        )
      ],
      centerTitle: true,
      title: Text('Bidder Game'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}

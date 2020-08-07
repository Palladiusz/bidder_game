import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CoinsBlock extends StatelessWidget {
  const CoinsBlock({@required this.userCoinsAmount});

  final int userCoinsAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Neumorphic(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                ImageIcon(
                  AssetImage("icons/coins.png"),
                  size: 30.0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('$userCoinsAmount coins'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

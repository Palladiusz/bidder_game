import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Block extends StatelessWidget {
  Block({this.upperText, this.lowerText});
  final String upperText;
  final String lowerText;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Text(
              upperText,
            ),
            Text(
              lowerText,
              style: TextStyle(color: Colors.greenAccent),
            )
          ],
        ),
      ),
    );
  }
}

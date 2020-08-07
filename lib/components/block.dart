import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Block extends StatelessWidget {
  Block({this.upperText, this.lowerText, this.textColor});
  final String upperText;
  final String lowerText;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        border: NeumorphicBorder(
          isEnabled: true,
          width: 4,
        ),
        depth: 3,
        intensity: 0.7,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Text(
              upperText,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              lowerText,
              style: TextStyle(
                color: textColor,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}

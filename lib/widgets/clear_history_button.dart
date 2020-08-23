import 'package:bidder_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

//TODO Review: add some suffix to ClearHistory to better indicate that this is widget, now it sounds like some kind of event..
class ClearHistory extends StatelessWidget {
  final Function onPress;
  const ClearHistory({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: NeumorphicButton(
        style: NeumorphicStyle(
          depth: 2,
          intensity: 0.5,
          lightSource: LightSource.top,
          color: kDarkerAccent,
        ),
        onPressed: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Clear history',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

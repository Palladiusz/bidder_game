import 'package:bidder_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({this.playTapped, this.isInputValid});

  final bool isInputValid;
  final void Function() playTapped;

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
        onPressed: isInputValid
            ? () {
                playTapped();
              }
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Play!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isInputValid ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bidder_game/widgets/slider/slider_button.dart';
import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final Function restartCallback;
  const RestartButton({
    Key key,
    this.restartCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: Column(
            children: [
              SliderButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPress: restartCallback,
              ),
              Text(
                'Restart game',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

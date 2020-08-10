import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constants.dart';
import 'slider_button.dart';
import 'slider_widget.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({
    Key key,
    @required this.winChance,
    this.onChangeCallback,
  }) : super(key: key);

  final double winChance;
  final Function(double) onChangeCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(children: [
          SliderButton(
            icon: Icon(
              Icons.exposure_neg_1,
              color: ktextRedColor,
            ),
            onPress: () {
              if (winChance > 0.02) {
                onChangeCallback(winChance - 0.01);
              }
            },
          ),
          SliderWidget(
            value: winChance,
            onChangeCallback: onChangeCallback,
          ),
          SliderButton(
            icon: Icon(
              Icons.exposure_plus_1,
              color: ktextGreenColor,
            ),
            onPress: () {
              if (winChance < 0.99) {
                onChangeCallback(winChance + 0.01);
              }
            },
          ),
        ]));
  }
}

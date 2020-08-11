import 'package:bidder_game/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SliderButton extends StatelessWidget {
  SliderButton({this.icon, this.onPress});

  final Icon icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      child: icon,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        border: NeumorphicBorder(
          isEnabled: true,
          width: 4,
        ),
        depth: 2,
        intensity: 0.9,
        lightSource: LightSource.top,
        color: kDarkerAccent,
      ),
      onPressed: onPress,
    );
  }
}

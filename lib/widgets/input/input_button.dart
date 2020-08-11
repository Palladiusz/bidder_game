import 'package:bidder_game/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InputButton extends StatelessWidget {
  const InputButton({Key key, this.icon, this.onPress}) : super(key: key);

  final Icon icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      child: icon,
      style: NeumorphicStyle(
        boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(12))),
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

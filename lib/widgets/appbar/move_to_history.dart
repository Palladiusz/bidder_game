import 'package:bidder_game/screens/history_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MoveToHistoryButton extends StatelessWidget {
  final bool visible;

  const MoveToHistoryButton({Key key, this.visible}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      tooltip: 'Move to history screen',
      style: NeumorphicStyle(
        depth: 1,
        intensity: 0.9,
        lightSource: LightSource.top,
      ),
      child: Icon(
        Icons.event_note,
        size: 40.0,
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
    );
  }
}

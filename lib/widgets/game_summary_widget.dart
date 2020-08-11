import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constants.dart';
import 'block.dart';

class GameSummaryWidget extends StatelessWidget {
  const GameSummaryWidget({
    Key key,
    @required this.winChance,
    @required this.reward,
  }) : super(key: key);

  final double winChance;
  final double reward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Block(
          upperText: 'Win chance:',
          lowerText: '${(winChance * 100).toInt()}%',
          textColor: winChance > 0.3 ? kTextGreenColor : kTextRedColor,
        ),
        Block(
          upperText: 'Reward:',
          lowerText: reward != null ? '${reward.toInt()} coins' : '-- coins',
          textColor: kTextGreenColor,
        ),
      ],
    );
  }
}

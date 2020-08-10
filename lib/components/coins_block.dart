import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CoinsBlock extends StatelessWidget {
  const CoinsBlock({@required this.userCoinsAmount});

  final int userCoinsAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            ImageIcon(
              AssetImage("icons/coins.png"),
              size: 60.0,
              color: Color(0xffDAA520),
            ),
            SizedBox(
              height: 8.0,
            ),
            //TODO: Use RichText+TextSpan widget instead of Row structure
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  '$userCoinsAmount',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'coins',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

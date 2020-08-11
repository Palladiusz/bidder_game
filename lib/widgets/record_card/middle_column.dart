import 'package:flutter/material.dart';

class MiddleColumn extends StatelessWidget {
  const MiddleColumn({
    Key key,
    @required this.bid,
    @required this.coinsBefore,
    @required this.coinsAfter,
    @required this.isWin,
    @required this.coinsDiff,
  }) : super(key: key);

  final String bid;
  final String coinsBefore;
  final String coinsAfter;
  final bool isWin;
  final String coinsDiff;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Bid: $bid',
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: <Widget>[
            Text(
              '$coinsBefore',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '$coinsAfter',
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
        Text(
          isWin ? '+ $coinsDiff' : '- $coinsDiff',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}

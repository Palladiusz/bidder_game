import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

class RecordCard extends StatelessWidget {
  final DateTime date;
  final String bid;
  final String coinsBefore;
  final String coinsAfter;
  final String coinsDiff;
  final String winChance;
  final bool isWin;

  const RecordCard(
      {this.bid,
      this.date,
      this.coinsBefore,
      this.coinsAfter,
      this.coinsDiff,
      this.winChance,
      this.isWin});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        color: isWin ? Colors.greenAccent : Colors.redAccent,
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${DateFormat.yMd().format(date)}',
                ),
                Text(
                  '${DateFormat.Hm().format(date)}',
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Bid: $bid',
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '$coinsBefore',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('$coinsAfter')
                  ],
                ),
                Text(
                  isWin ? '+ $coinsDiff' : '- $coinsDiff',
                )
              ],
            ),
            Text('$winChance'),
          ],
        ),
      ),
    );
  }
}

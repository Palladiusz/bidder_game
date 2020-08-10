import 'package:bidder_game/constants.dart';
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
    //TODO: Split to smaller widgets
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -5,
        intensity: 0.5,
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: isWin ? kbasicGreenColor : kbasicRedColor,
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
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${DateFormat.Hm().format(date)}',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Column(
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
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Win chance:'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$winChance',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

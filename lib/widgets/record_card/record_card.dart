import 'package:bidder_game/constants.dart';
import 'package:bidder_game/widgets/record_card/date_column.dart';
import 'package:bidder_game/widgets/record_card/middle_column.dart';
import 'package:bidder_game/widgets/record_card/win_chance_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
      style: NeumorphicStyle(
        depth: -5,
        intensity: 0.5,
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: isWin ? kBasicGreenColor : kBasicRedColor,
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DateColumn(date: date),
                MiddleColumn(
                  bid: bid,
                  coinsBefore: coinsBefore,
                  coinsAfter: coinsAfter,
                  isWin: isWin,
                  coinsDiff: coinsDiff,
                ),
                WinChanceColumn(winChance: winChance),
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

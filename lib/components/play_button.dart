import 'package:bidder_game/components/bidder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:bidder_game/data/moor_database.dart';

class PlayButton extends StatelessWidget {
  const PlayButton(
      {this.isValidateInput,
      this.coinsCallback,
      this.reward,
      this.userBid,
      this.winChance,
      this.userCoinsAmount});

  final bool isValidateInput;
  final double reward;
  final int userBid;
  final double winChance;
  final Function coinsCallback;
  final int userCoinsAmount;

  // void userWin() {
  //   userCoinsAmount +
  // }

  @override
  Widget build(BuildContext context) {
    int currentCoins = userCoinsAmount;
    BidderService _bidderService = BidderService();
    AppDatabase db = Provider.of(context);
    return NeumorphicButton(
      onPressed: isValidateInput
          ? () {
              bool isWin = _bidderService.play(winChance);
              isWin ? currentCoins += reward.toInt() : currentCoins -= userBid;

              _bidderService.insertNewRecord(
                  db: db,
                  bid: userBid,
                  coinsBefore: userCoinsAmount,
                  coinsAfter: currentCoins,
                  coinsDiff: (userCoinsAmount - currentCoins).abs(),
                  isWin: isWin,
                  winChance: winChance);
              coinsCallback(currentCoins);

              showDialog(
                context: context,
                builder: (BuildContext context) => new AlertDialog(
                  title: Text(
                    isWin ? "You won!" : "You lose! :(",
                    style: TextStyle(color: isWin ? Colors.green : Colors.red),
                  ),
                  content: Text("You current coin amount is: $currentCoins"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            }
          : null,
      child: Text(
        'Play!',
        style: TextStyle(
          fontSize: 34,
          color: isValidateInput ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

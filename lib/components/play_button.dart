import 'package:bidder_game/components/bidder_service.dart';
import 'package:bidder_game/constants.dart';
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
      this.userCoinsAmount,
      this.validationCallback,
      this.restart});

  final bool isValidateInput;
  final double reward;
  final int userBid;
  final double winChance;
  final Function coinsCallback;
  final Function validationCallback;
  final Function restart;
  final int userCoinsAmount;

  @override
  Widget build(BuildContext context) {
    int currentCoins = userCoinsAmount;
    BidderService _bidderService = BidderService();
    AppDatabase db = Provider.of(context);
    return Container(
      height: 60,
      width: double.infinity,
      child: NeumorphicButton(
        style: NeumorphicStyle(
          depth: 2,
          intensity: 0.5,
          lightSource: LightSource.top,
          color: kDarkerAccent,
        ),
        onPressed: isValidateInput
            ? () {
                bool isWin = _bidderService.play(winChance);
                isWin
                    ? currentCoins += reward.toInt()
                    : currentCoins -= userBid;

                _bidderService.insertNewRecord(
                    db: db,
                    bid: userBid,
                    coinsBefore: userCoinsAmount,
                    coinsAfter: currentCoins,
                    coinsDiff: (userCoinsAmount - currentCoins).abs(),
                    isWin: isWin,
                    winChance: winChance);
                coinsCallback(currentCoins);
                _bidderService.saveCoinsInSP(currentCoins);

                if (userBid > currentCoins) {
                  validationCallback(false);
                }

                if (currentCoins <= 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => new AlertDialog(
                      title: Text(
                        "You lose all coins! :(",
                        style: TextStyle(color: ktextRedColor),
                      ),
                      content: Text('Unlucky! Do You want play more?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Aye sir!"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            restart();
                          },
                        ),
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => new AlertDialog(
                      title: Text(
                        isWin ? "You won!" : "You lose! :(",
                        style: TextStyle(
                            color: isWin ? ktextGreenColor : ktextRedColor),
                      ),
                      content:
                          Text("You current coin amount is: $currentCoins"),
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
              }
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Play!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isValidateInput ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

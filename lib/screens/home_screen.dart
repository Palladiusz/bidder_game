import 'package:bidder_game/components/bidder_service.dart';
import 'package:bidder_game/components/coins_block.dart';
import 'package:bidder_game/components/home_appbar.dart';
import 'package:bidder_game/components/input_field.dart';
import 'package:bidder_game/components/move_to_history.dart';
import 'package:bidder_game/components/play_button.dart';
import 'package:bidder_game/components/slider_component.dart';
import 'package:bidder_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bidder_game/components/block.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isValidateInput = false;
  int userCoinsAmount = 100;
  double winChance = 0.5;
  int userBid;
  double reward;
  bool isWin;
  bool isButtonVisible;
  BidderService _bidderService = BidderService();

  void validationUpdate(bool val) {
    setState(() {
      isValidateInput = val;
    });
  }

  void updateReward(double newReward) {
    setState(() {
      reward = newReward;
    });
  }

  void toggleInputValue(value) {
    setState(() {
      userBid = value;
    });
  }

  void toggleWinChance(value) {
    setState(() {
      winChance = value;
    });
  }

  void toggleCoins(value) {
    setState(() {
      userCoinsAmount = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Bidder Game',
        actionButton: MoveToHistoryButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: _bidderService.getCoinsFromSP(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    isButtonVisible = true;
                    userCoinsAmount = snapshot.data;
                    return CoinsBlock(
                      userCoinsAmount: snapshot.data,
                    );
                  } else {
                    return CoinsBlock(
                      userCoinsAmount: userCoinsAmount,
                    );
                  }
                }),
            SizedBox(
              height: 40,
            ),
            InputField(
              rewardPass: updateReward,
              userCoinsAmount: userCoinsAmount,
              validation: validationUpdate,
              winChance: winChance,
              toggleInputValue: toggleInputValue,
            ),
            SizedBox(
              height: 40,
            ),
            SliderComponent(
              isValidateInput: isValidateInput,
              rewardCallback: updateReward,
              userBid: userBid,
              winChanceCallback: toggleWinChance,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  upperText: 'Win chance:',
                  lowerText: '${(winChance * 100).toInt()}%',
                  textColor: winChance > 0.3 ? ktextGreenColor : ktextRedColor,
                ),
                Block(
                  upperText: 'Reward:',
                  lowerText:
                      reward != null ? '${reward.toInt()} coins' : '-- coins',
                  textColor: ktextGreenColor,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: PlayButton(
        isValidateInput: isValidateInput,
        coinsCallback: toggleCoins,
        reward: reward,
        userBid: userBid,
        winChance: winChance,
        userCoinsAmount: userCoinsAmount,
        validationCallback: validationUpdate,
      ),
    );
  }
}

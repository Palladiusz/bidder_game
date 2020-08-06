import 'package:bidder_game/components/coins_block.dart';
import 'package:bidder_game/components/home_appbar.dart';
import 'package:bidder_game/components/input_field.dart';
import 'package:bidder_game/components/play_button.dart';
import 'package:bidder_game/components/slider_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bidder_game/components/block.dart';
import 'package:provider/provider.dart';

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
  double reward = 12;
  bool isWin;

  void validationUpdate(bool val) {
    isValidateInput = val;
  }

  void updateReward(double newReward) {
    reward = newReward;
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
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(),
      body: Neumorphic(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CoinsBlock(userCoinsAmount: userCoinsAmount),
            InputField(
              rewardPass: updateReward,
              userCoinsAmount: userCoinsAmount,
              validation: validationUpdate,
              winChance: winChance,
              toggleInputValue: toggleInputValue,
            ),
            SliderComponent(
              isValidateInput: isValidateInput,
              rewardCallback: updateReward,
              userBid: userBid,
              winChanceCallback: toggleWinChance,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  upperText: 'Win chance:',
                  lowerText: '${(winChance * 100).toInt()}%',
                ),
                Block(
                  upperText: 'Reward:',
                  lowerText: '${reward.toInt()} coins',
                ),
              ],
            ),
            PlayButton(
              isValidateInput: isValidateInput,
              coinsCallback: toggleCoins,
              reward: reward,
              userBid: userBid,
              winChance: winChance,
              userCoinsAmount: userCoinsAmount,
            )
          ],
        ),
      ),
    );
  }
}

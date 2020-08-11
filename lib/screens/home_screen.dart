import 'package:bidder_game/view_models/home_screen_vm.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/widgets/coins_block.dart';
import 'package:bidder_game/widgets/game_summary_widget/game_summary_widget.dart';
import 'package:bidder_game/widgets/appbar/main_appbar.dart';
import 'package:bidder_game/widgets/input_field.dart';
import 'package:bidder_game/widgets/appbar/move_to_history.dart';
import 'package:bidder_game/widgets/play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../widgets/slider/slider_component.dart';
import '../constants.dart';
import '../data/moor_database.dart';
import '../view_models/record_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BidderService _bidderService = BidderService();
  TextEditingController inputCtrl = TextEditingController();
  HomeScreenViewModel vm = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    inputCtrl.addListener(() {
      final userBid = _bidderService.tryParseAndValidateUserBid(inputCtrl.text);
      updateViewModel(vm.copyWith(isValidateInput: userBid != null));
    });
  }

  @override
  void dispose() {
    inputCtrl.dispose();
    super.dispose();
  }

  void updateViewModel(HomeScreenViewModel vm) {
    setState(() {
      this.vm = vm;
    });
  }

  void restartGame() {
    _bidderService.saveCoinsInSP(100);
    updateViewModel(vm.copyWith(userCoinsAmount: 100, winChance: 0.5));
    inputCtrl.text = '';
  }

  void play(AppDatabase db) async {
    final userBid = _bidderService.tryParseAndValidateUserBid(inputCtrl.text);
    if (userBid != null) {
      RecordViewModel lastGame =
          await _bidderService.play(vm.winChance, userBid, db);
      updateViewModel(vm.copyWith(
          lastGame: lastGame, userCoinsAmount: _bidderService.currentCoins));
      if (_bidderService.currentCoins <= 0) {
        showLooseDialog();
      } else {
        showWinDialog(lastGame);
      }
    }
  }

  Future showWinDialog(RecordViewModel lastGame) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: Text(
          lastGame.isWin ? "You won!" : "You lose! :(",
          style: TextStyle(
              color: lastGame.isWin ? kTextGreenColor : kTextRedColor),
        ),
        content: Text("You current coin amount is: ${vm.userCoinsAmount}"),
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

  Future showLooseDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: Text(
          "You lose all coins! :(",
          style: TextStyle(color: kTextRedColor),
        ),
        content: Text('Unlucky! Do You want play more?'),
        actions: <Widget>[
          FlatButton(
            child: Text("Aye sir!"),
            onPressed: () {
              Navigator.of(context).pop();
              restartGame();
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
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
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
                    vm.copyWith(userCoinsAmount: snapshot.data);
                    return CoinsBlock(
                      userCoinsAmount: snapshot.data,
                    );
                  } else {
                    return CoinsBlock(
                      userCoinsAmount: 0,
                    );
                  }
                }),
            SizedBox(
              height: 40,
            ),
            InputField(inputCtrl: inputCtrl),
            SizedBox(
              height: 40,
            ),
            SliderComponent(
              winChance: vm.winChance,
              onChangeCallback: (value) {
                updateViewModel(vm.copyWith(winChance: value));
              },
            ),
            SizedBox(
              height: 40,
            ),
            GameSummaryWidget(
              winChance: vm.winChance,
              reward: _bidderService.calculateReward(
                  _bidderService.tryParseAndValidateUserBid(inputCtrl.text),
                  vm.winChance),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: PlayButton(
        isInputValid: vm.isValidateInput,
        playTapped: () => play(db),
      ),
    );
  }
}

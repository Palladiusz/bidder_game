import 'package:bidder_game/blocs/play/play_bloc.dart';
import 'package:bidder_game/view_models/home_screen_vm.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/widgets/coins_block.dart';
import 'package:bidder_game/widgets/game_summary_widget/game_summary_widget.dart';
import 'package:bidder_game/widgets/appbar/main_appbar.dart';
import 'package:bidder_game/widgets/input/input_field.dart';
import 'package:bidder_game/widgets/appbar/move_to_history.dart';
import 'package:bidder_game/widgets/play_button.dart';
import 'package:bidder_game/widgets/restart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../constants.dart';
import '../widgets/slider/slider_component.dart';

class HomeScreen extends StatefulWidget {
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
      validation();
    });
  }

  @override
  void dispose() {
    inputCtrl.dispose();
    super.dispose();
  }

  updateViewModel(HomeScreenViewModel vm) {
    setState(() {
      this.vm = vm;
    });
  }

  void validation() {
    final userBid = _bidderService.tryParseAndValidateUserBid(inputCtrl.text);
    int coins = BlocProvider.of<PlayBloc>(context).state.coins;
    updateViewModel(vm.copyWith(
      isValidateInput: userBid != null && userBid != 0 && coins >= userBid,
    ));
  }

  Future showPlayDialog({bool isWin}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: Text(
          isWin ? "You won!" : "You lose! :(",
          style: TextStyle(color: isWin ? kTextGreenColor : kTextRedColor),
        ),
        content: Text("Gratulations! Good luck in next try ;)"),
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
            },
          ),
          FlatButton(
            child: Text("Ok :("),
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
    return Scaffold(
      appBar: MyAppBar(
        title: 'Bidder Game',
        actionButton: MoveToHistoryButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<PlayBloc, PlayStateBase>(
            listenWhen: (previous, current) {
              return (current is PlayState && current.vm.lastGame != null);
            },
            listener: (context, state) async {
              if (state is PlayState) {
                var lastGame = state.vm.lastGame;
                int coins = int.parse(lastGame.coinsAfter);
                updateViewModel(state.vm);
                if (lastGame.isWin == true) {
                  showPlayDialog(isWin: true);
                } else if (coins <= 0) {
                  showLooseDialog();
                } else if (lastGame.isWin == false && coins > 0) {
                  showPlayDialog(isWin: false);
                }
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RestartButton(
                    restartCallback: () {
                      BlocProvider.of<PlayBloc>(context)
                          .add(RestartGameEvent());
                      updateViewModel(vm.copyWith(winChance: 0.5));
                      inputCtrl.text = '';
                    },
                  ),
                  CoinsBlock(
                    userCoinsAmount: state.coins,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputField(
                    inputCtrl: inputCtrl,
                    userBid: _bidderService
                        .tryParseAndValidateUserBid(inputCtrl.text),
                  ),
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
                        _bidderService
                            .tryParseAndValidateUserBid(inputCtrl.text),
                        vm.winChance),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: PlayButton(
        isInputValid: vm?.isValidateInput == true,
        playTapped: () async {
          BlocProvider.of<PlayBloc>(context).add(
            PlayEvent(
              winChance: vm.winChance,
              bidAmount:
                  _bidderService.tryParseAndValidateUserBid(inputCtrl.text),
            ),
          );
        },
      ),
    );
  }
}

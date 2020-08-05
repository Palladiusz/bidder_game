import 'package:bidder_game/components/home_appbar.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bidder_game/components/block.dart';
import 'package:bidder_game/components/bidder_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isValidateInput = false;
  int userCoinsAmount = 100;
  double _winChance = 0.5;
  int userBid;
  double reward = 12;
  bool isWin;

  BidderService _bidderService = BidderService();

  @override
  Widget build(BuildContext context) {
    AppDatabase db = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(),
      body: Neumorphic(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Neumorphic(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("icons/coins.png"),
                          size: 30.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text('$userCoinsAmount coins')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54.0),
              child: Neumorphic(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Insert your bid',
                    labelStyle: TextStyle(
                      fontSize: 26.0,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      var inputValue = int.tryParse(value);
                      if (inputValue != null && inputValue < userCoinsAmount) {
                        isValidateInput = true;
                        userBid = inputValue;
                        reward =
                            _bidderService.calculateReward(userBid, _winChance);
                      } else {
                        isValidateInput = false;
                      }
                    });
                  },
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: NeumorphicSlider(
                    value: _winChance,
                    min: 0.01,
                    max: 0.99,
                    onChanged: (value) {
                      setState(() {
                        _winChance = value;
                        if (isValidateInput) {
                          reward = _bidderService.calculateReward(
                              userBid, _winChance);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  upperText: 'Win chance:',
                  lowerText: '${(_winChance * 100).toInt()}%',
                ),
                Block(
                  upperText: 'Reward:',
                  lowerText: '${reward.toInt()} coins',
                ),
              ],
            ),
            NeumorphicButton(
              onPressed: isValidateInput
                  ? () {
                      setState(() {
                        isWin = _bidderService.play(_winChance);
                        isWin
                            ? userCoinsAmount += reward.toInt()
                            : userCoinsAmount -= userBid;
                      });
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) => new AlertDialog(
                      //     title: Text(
                      //       isWin ? "You won!" : "You lose! :(",
                      //       style: TextStyle(
                      //           color: isWin ? Colors.green : Colors.red),
                      //     ),
                      //     content: Text(
                      //         "You current coin amount is: $userCoinsAmount"),
                      //     actions: <Widget>[
                      //       FlatButton(
                      //         child: Text("Close"),
                      //         onPressed: () {
                      //           Navigator.of(context).pop();
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // );
                      _bidderService.playMock(db);
                    }
                  : null,
              child: Text(
                'Play!',
                style: TextStyle(
                  fontSize: 34,
                  color: isValidateInput ? Colors.white : Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

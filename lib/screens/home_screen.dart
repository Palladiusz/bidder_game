import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bidder_game/components/block.dart';
import 'package:bidder_game/screens/history_screen.dart';
import 'package:bidder_game/components/bidder_service.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NeumorphicAppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_right,
              size: 50.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryScreen(),
                ),
              );
            },
            tooltip: 'Move to history screen',
          )
        ],
        centerTitle: true,
        title: Text('Bidder Game'),
      ),
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
                      var inputValue = int.parse(value);
                      if (inputValue < userCoinsAmount && inputValue is int) {
                        isValidateInput = true;
                        userBid = inputValue;
                        reward =
                            _bidderService.calculateReward(userBid, _winChance);
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
                        reward =
                            _bidderService.calculateReward(userBid, _winChance);
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => new AlertDialog(
                          title: Text(
                            isWin ? "You won!" : "You lose! :(",
                            style: TextStyle(
                                color: isWin ? Colors.green : Colors.red),
                          ),
                          content: Text(
                              "You current coin amount is: $userCoinsAmount"),
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
            )
          ],
        ),
      ),
    );
  }
}

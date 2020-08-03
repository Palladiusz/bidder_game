import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bidder_game/components/block.dart';
import 'package:bidder_game/screens/history_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isValidateInput = false;
  int userCoinsAmount = 13;
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
                    labelText: 'Input your bid',
                    labelStyle: TextStyle(
                      fontSize: 26.0,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      var inputValue = int.parse(value);
                      if (inputValue < userCoinsAmount && inputValue is int) {
                        isValidateInput = true;
                      }
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NeumorphicSlider(
                value: 50.0,
                min: 1.0,
                max: 99.0,
                onChanged: (double newValue) {
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  upperText: 'Win chance:',
                  lowerText: '72%',
                ),
                Block(
                  upperText: 'Reward:',
                  lowerText: '34 coins',
                ),
              ],
            ),
            NeumorphicButton(
              onPressed: isValidateInput ? () {} : null,
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

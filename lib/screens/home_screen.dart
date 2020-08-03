import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bidder_game/components/block.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
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
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text('123 coins')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Neumorphic(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Input your bid',
                ),
              ),
            ),
            NeumorphicSlider(
              value: 50.0,
              min: 1.0,
              max: 99.0,
              onChanged: (double newValue) {
                setState(() {});
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  upperText: 'Win chance:',
                  lowerText: '72%',
                ),
                Block(
                  upperText: 'Reward',
                  lowerText: '34 coins',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

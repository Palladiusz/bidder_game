import 'package:flutter/material.dart';

class WinChanceColumn extends StatelessWidget {
  const WinChanceColumn({
    Key key,
    @required this.winChance,
  }) : super(key: key);

  final String winChance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Win chance:'),
        SizedBox(
          height: 10,
        ),
        Text(
          '$winChance',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

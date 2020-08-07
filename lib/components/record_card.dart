import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RecordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        color: Colors.redAccent,
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '${DateTime.now()}',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Bid: 20'),
                Row(
                  children: <Widget>[Text('100'), Text('--->'), Text('150')],
                ),
                Text('+50')
              ],
            ),
            Text('50%'),
          ],
        ),
      ),
    );
  }
}

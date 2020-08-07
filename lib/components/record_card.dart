import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

class RecordCard extends StatelessWidget {
  final DateTime date = DateTime.now();
  var day = DateFormat.yMd().format(DateTime.now());
  var hour = DateFormat.Hm().format(DateTime.now());
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$day',
                ),
                Text(
                  '$hour',
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Bid: 20'),
                Row(
                  children: <Widget>[
                    Text('100'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('150')
                  ],
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

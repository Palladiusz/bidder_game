import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateColumn extends StatelessWidget {
  const DateColumn({
    Key key,
    @required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${DateFormat.yMd().format(date)}',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${DateFormat.Hm().format(date)}',
          style: TextStyle(fontSize: 22),
        )
      ],
    );
  }
}

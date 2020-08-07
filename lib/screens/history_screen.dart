import 'package:bidder_game/components/home_appbar.dart';
import 'package:bidder_game/components/record_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HistoryScreen extends StatelessWidget {
  static const String id = '/history_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Neumorphic(
        child: ListView(
          children: <Widget>[RecordCard()],
        ),
      ),
    );
  }
}

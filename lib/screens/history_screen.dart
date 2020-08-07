import 'package:bidder_game/components/bidder_service.dart';
import 'package:bidder_game/components/home_appbar.dart';
import 'package:bidder_game/components/record_card.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  static const String id = '/history_screen';
  @override
  Widget build(BuildContext context) {
    AppDatabase db = Provider.of(context);
    BidderService _bidderService = BidderService();

    return Scaffold(
      appBar: HomeAppBar(),
      body: Neumorphic(
        child: FutureBuilder(
          future: _bidderService.getAllDb(db),
          builder: (BuildContext context,
              AsyncSnapshot<List<RecordViewModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data
                    .map((e) => RecordCard(
                          bid: e.bid,
                          coinsAfter: e.coinsAfter,
                          coinsBefore: e.coinsBefore,
                          coinsDiff: e.coinsDiff,
                          isWin: e.isWin,
                          winChance: e.winChance,
                          date: e.date,
                        ))
                    .toList(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

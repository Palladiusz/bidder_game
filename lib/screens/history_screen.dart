import 'package:bidder_game/widgets/bidder_service.dart';
import 'package:bidder_game/widgets/home_appbar.dart';
import 'package:bidder_game/widgets/record_card.dart';
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
    //TODO: Move bidder service out of build method
    BidderService _bidderService = BidderService();

    return Scaffold(
      appBar: MyAppBar(
        title: 'History of Records',
      ),
      body: FutureBuilder(
        future: _bidderService.getAllDb(db),
        builder: (BuildContext context,
            AsyncSnapshot<List<RecordViewModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              shrinkWrap: true,
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
                  .toList()
                  //TODO: Instead of reversing it here, please implement it in service - sort method in db by ID descending
                  .reversed
                  .toList(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

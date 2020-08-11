import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/widgets/appbar/main_appbar.dart';
import 'package:bidder_game/widgets/clear_history_button.dart';
import 'package:bidder_game/widgets/record_card/record_card.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  static const String id = '/history_screen';
  final BidderService _bidderService = BidderService();

  @override
  Widget build(BuildContext context) {
    AppDatabase db = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'History of Records',
        ),
        body: StreamBuilder(
          stream: _bidderService.watchAll(db),
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
                    .toList(),
              );
            }
            return Container();
          },
        ),
        bottomNavigationBar: ClearHistory(
          onPress: () {
            _bidderService.deleteAlldb(db);
          },
        ),
      ),
    );
  }
}

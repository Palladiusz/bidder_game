import 'dart:async';

import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:bidder_game/widgets/record_card/record_card.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({@required this.db}) : super(HistoryLoadedState([]));
  BidderService _bidderService = BidderService();
  final AppDatabase db;

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is LoadHistoryEvent) {
      yield HistoryLoadedState(await _fetchRecords(db));
    }
    if (event is RestartHistoryEvent) {
      _bidderService.deleteAlldb(db);
      yield HistoryLoadedState(await _fetchRecords(db));
    }
  }
}

Future<List<RecordCard>> _fetchRecords(db) async {
  BidderService _bidderService = BidderService();

  Future<List<RecordViewModel>> list = _bidderService.getAll(db);
  return (await list)
      .map((e) => RecordCard(
            bid: e.bid,
            coinsAfter: e.coinsAfter,
            coinsBefore: e.coinsBefore,
            coinsDiff: e.coinsDiff,
            isWin: e.isWin,
            winChance: e.winChance,
            date: e.date,
          ))
      .toList();
}

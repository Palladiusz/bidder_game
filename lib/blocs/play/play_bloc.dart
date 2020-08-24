import 'dart:async';

import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/view_models/home_screen_vm.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEventBase, PlayStateBase> {
  PlayBloc({this.db}) : super(PlayLoadingState(null));
  BidderService _bidderService = BidderService();
  final AppDatabase db;

  @override
  Stream<PlayState> mapEventToState(
    PlayEventBase event,
  ) async* {
    if (event is PlayEvent) {
      yield* _playTheGame(event);
    }
    //TODO Review: Please use ELSE IF now you make 3 if operations, with if else you will make only 1.
    if (event is RestartGameEvent) {
      _bidderService.saveCoinsInSP(100);
      yield PlayState(
        100,
        HomeScreenViewModel(
            isValidateInput: false, lastGame: null, winChance: 0.5),
      );
    }
    //TODO Review: Please use ELSE IF now you make 3 if operations, with if else you will make only 1.
    if (event is PlayEventInitial) {
      yield PlayState(
        await _bidderService.getCoinsFromSP(),
        HomeScreenViewModel(
            isValidateInput: false, lastGame: null, winChance: 0.5),
      );
    }
  }

  Stream<PlayState> _playTheGame(PlayEvent event) async* {
    final newPlayRecord = await _bidderService.play(
        event.winChance, event.bidAmount, db, state.coins);
    final newCoins = int.parse(newPlayRecord.coinsAfter);
    yield PlayState(
        newCoins,
        HomeScreenViewModel(
          isValidateInput: newCoins >= event.bidAmount,
          lastGame: newPlayRecord,
          winChance: event.winChance,
        ));
  }
}

import 'dart:async';

import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEventBase, PlayStateBase> {
  PlayBloc({this.db}) : super(PlayLoadingState(100, 0.5, false));
  var _bidderService = BidderService();
  final AppDatabase db;

  @override
  Stream<PlayState> mapEventToState(
    PlayEventBase event,
  ) async* {
    if (event is PlayEvent) {
      yield* _playTheGame(event);
    } else if (event is RestartGameEvent) {
      _bidderService.saveCoinsInSP(100);
      yield PlayState(
        coins: 100,
        isValidateInput: false,
        lastGame: null,
        winChance: 0.5,
      );
    } else if (event is PlayEventInitial) {
      yield PlayState(
        coins: await _bidderService.getCoinsFromSP(),
        isValidateInput: false,
        lastGame: null,
        winChance: 0.5,
      );
    } else if (event is PlayEventAdjustWinChance) {
      yield* _wC(event);
    } else if (event is PlayEventValidate) {
      yield* _checkValidation(event);
    }
  }

  Stream<PlayState> _playTheGame(PlayEvent event) async* {
    final newPlayRecord = await _bidderService.play(
        event.winChance, event.bidAmount, db, state.coins);
    final newCoins = int.parse(newPlayRecord.coinsAfter);
    yield PlayState(
        coins: newCoins,
        isValidateInput: newCoins >= event.bidAmount,
        lastGame: newPlayRecord,
        winChance: event.winChance);
  }

  Stream<PlayState> _wC(PlayEventAdjustWinChance event) async* {
    yield PlayState(
        winChance: event.winChance,
        coins: state.coins,
        isValidateInput: state.isValidateInput);
  }

  Stream<PlayState> _checkValidation(PlayEventValidate event) async* {
    int bid = event.bidAmount;
    int coins = state.coins;
    bool isValidate = (bid != null && bid != 0 && coins >= bid);

    yield PlayState(
      coins: state.coins,
      winChance: state.winChance,
      isValidateInput: isValidate,
    );
  }
}

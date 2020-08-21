import 'dart:async';

import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/view_models/home_screen_vm.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEventBase, PlayStateBase> {
  PlayBloc({this.db}) : super(PlayStateBase(100));
  BidderService _bidderService = BidderService();
  final AppDatabase db;

  @override
  Stream<PlayState> mapEventToState(
    PlayEventBase event,
  ) async* {
    if (event is PlayEvent) {
      yield PlayState(await _playEvent(
          event.winChance, event.bidAmount, event.vm, state.coins));
    }
    if (event is RestartGameEvent) {
      _bidderService.saveCoinsInSP(100);
      yield PlayState(100);
    }
    if (event is PlayEventInitial) {
      yield PlayState(await _bidderService.getCoinsFromSP());
    }
    // TODO: implement mapEventToState
  }

  Future<int> _playEvent(
      winChance, userBid, HomeScreenViewModel vm, coins) async {
    int newCoins = await _bidderService.play(winChance, userBid, db, coins);
    vm.copyWith(isValidateInput: newCoins >= userBid);

    return newCoins;
  }

  void _resetCoins() {
    _bidderService.currentCoins = 100;
    _bidderService.saveCoinsInSP(100);
  }
}

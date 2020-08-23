import 'dart:async';

import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:bidder_game/view_models/home_screen_vm.dart';
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
      yield PlayState(await _playEvent(event.winChance, event.bidAmount,
          event.vm, state.coins, event.updateViewModelCallBack));
    }
    //TODO Review: Please use ELSE IF now you make 3 if operations, with if else you will make only 1.
    if (event is RestartGameEvent) {
      _bidderService.saveCoinsInSP(100);
      yield PlayState(100);
    }
    //TODO Review: Please use ELSE IF now you make 3 if operations, with if else you will make only 1.
    if (event is PlayEventInitial) {
      yield PlayState(await _bidderService.getCoinsFromSP());
    }
  }

  Future<int> _playEvent(
    winChance,
    userBid,
    HomeScreenViewModel vm,
    coins,
    updateViewModel,
  ) async {
    int newCoins = await _bidderService.play(winChance, userBid, db, coins);

    updateViewModel(vm.copyWith(isValidateInput: newCoins >= userBid));

    return newCoins;
  }
}

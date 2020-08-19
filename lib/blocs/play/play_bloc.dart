import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEventBase, PlayStateBase> {
  PlayBloc(int coins) : super(PlayState(coins));

  @override
  Stream<PlayState> mapEventToState(
    PlayEventBase event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

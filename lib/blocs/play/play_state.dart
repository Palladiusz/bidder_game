part of 'play_bloc.dart';

@immutable
abstract class PlayStateBase {
  final int coins;

  PlayStateBase(this.coins);
}

class PlayLoadingState extends PlayStateBase {
  PlayLoadingState(int coins) : super(coins);
}

class PlayState extends PlayStateBase {
  final HomeScreenViewModel vm;

  PlayState(int coins, this.vm) : super(coins);
}

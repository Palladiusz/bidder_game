part of 'play_bloc.dart';

@immutable
abstract class PlayStateBase {
  final int coins;

  PlayStateBase(this.coins);
}

class PlayState extends PlayStateBase {
  PlayState(int coins) : super(coins);
}

class PlayWonState extends PlayStateBase {
  PlayWonState(int coins) : super(coins);
}

class PlayLoseState extends PlayStateBase {
  PlayLoseState(int coins) : super(coins);
}

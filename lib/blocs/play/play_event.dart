part of 'play_bloc.dart';

@immutable
abstract class PlayEventBase {}

class PlayEvent extends PlayEventBase {
  final double winChance;
  final int bidAmount;

  PlayEvent(this.winChance, this.bidAmount);
}

class RestartGameEvent extends PlayEventBase {}

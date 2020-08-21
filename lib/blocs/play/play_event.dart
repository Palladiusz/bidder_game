part of 'play_bloc.dart';

@immutable
class PlayEventBase {}

class PlayEvent extends PlayEventBase {
  final double winChance;
  final int bidAmount;
  final HomeScreenViewModel vm;

  PlayEvent(this.winChance, this.bidAmount, this.vm);
}

class RestartGameEvent extends PlayEventBase {}

class PlayEventInitial extends PlayEventBase {}

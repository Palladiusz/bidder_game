part of 'play_bloc.dart';

@immutable
class PlayEventBase {}

class PlayEvent extends PlayEventBase {
  final double winChance;
  final int bidAmount;

  PlayEvent({this.winChance, this.bidAmount});
}

class RestartGameEvent extends PlayEventBase {}

class PlayEventInitial extends PlayEventBase {}

class PlayEventAdjustWinChance extends PlayEventBase {
  final double winChance;

  PlayEventAdjustWinChance({this.winChance});
}

class PlayEventValidate extends PlayEventBase {
  final int bidAmount;

  PlayEventValidate(this.bidAmount);
}

part of 'play_bloc.dart';

@immutable
abstract class PlayStateBase {
  final int coins;
  final double winChance;
  final bool isValidateInput;

  PlayStateBase(this.coins, this.winChance, this.isValidateInput);
}

class PlayLoadingState extends PlayStateBase {
  PlayLoadingState(int coins, winChance, isValidateInput)
      : super(coins, winChance, isValidateInput);
}

class PlayState extends PlayStateBase {
  final bool isValidateInput;
  final RecordViewModel lastGame;
  final double winChance;

  PlayState({int coins, this.isValidateInput, this.lastGame, this.winChance})
      : super(coins, winChance, isValidateInput);
}

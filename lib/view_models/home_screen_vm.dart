import 'package:bidder_game/view_models/record_view_model.dart';

class HomeScreenViewModel {
  final bool isValidateInput;
  final int userCoinsAmount;
  final RecordViewModel lastGame;
  final double winChance;

  HomeScreenViewModel(
      {this.isValidateInput = false,
      this.userCoinsAmount = 100,
      this.winChance = 0.5,
      this.lastGame});

  HomeScreenViewModel copyWith({
    bool isValidateInput,
    int userCoinsAmount,
    double winChance,
    RecordViewModel lastGame,
  }) {
    return HomeScreenViewModel(
      isValidateInput: isValidateInput ?? this.isValidateInput,
      userCoinsAmount: userCoinsAmount ?? this.userCoinsAmount,
      winChance: winChance ?? this.winChance,
      lastGame: lastGame ?? this.lastGame,
    );
  }
}

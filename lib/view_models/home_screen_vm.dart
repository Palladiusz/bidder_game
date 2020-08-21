import 'package:bidder_game/view_models/record_view_model.dart';

class HomeScreenViewModel {
  final bool isValidateInput;

  final RecordViewModel lastGame;
  final double winChance;

  HomeScreenViewModel(
      {this.isValidateInput = false, this.winChance = 0.5, this.lastGame});

  HomeScreenViewModel copyWith({
    bool isValidateInput,
    double winChance,
    RecordViewModel lastGame,
  }) {
    return HomeScreenViewModel(
      isValidateInput: isValidateInput ?? this.isValidateInput,
      winChance: winChance ?? this.winChance,
      lastGame: lastGame ?? this.lastGame,
    );
  }
}

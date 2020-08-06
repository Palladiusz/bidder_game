import 'dart:math';

import 'package:bidder_game/data/moor_database.dart';

class BidderService {
  double fee = 0.02;

  calculateReward(int bidAmount, double winChance) =>
      (bidAmount / winChance) * (1 - fee);

  bool play(double winChance) {
    Random random = new Random();
    var randomNum = random.nextDouble();

    if (randomNum >= winChance) {
      return false;
    } else {
      return true;
    }
  }

  // void calculateWin(int reward, int coins) => coins += reward;
  // void calculateLose(int bid, int coins) => coins -= bid;

  void playMock(AppDatabase db) async {
    await db.insertRecord(Record(
        bidAmount: 2,
        coinsAfterMatch: 99,
        coinsBeforeMatch: 23,
        coinsChangeAmount: 76,
        date: DateTime.now(),
        isWin: true,
        winChance: 50,
        id: null));

    var records = await db.getAll();
    print(records);
  }
}

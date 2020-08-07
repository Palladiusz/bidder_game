import 'dart:math';

import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/view_models/record_view_model.dart';

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

  Future<List<RecordViewModel>> getAllDb(AppDatabase db) async {
    List<Record> recordList = await db.recordsDao.getAll();
    return recordList.map((e) => RecordViewModel.fromRecord(e)).toList();
  }

  void insertNewRecord(
      {AppDatabase db,
      bid,
      coinsAfter,
      coinsBefore,
      coinsDiff,
      isWin,
      winChance}) async {
    await db.recordsDao.insertRecord(
      Record(
          bidAmount: bid,
          coinsAfterMatch: coinsAfter,
          coinsBeforeMatch: coinsBefore,
          coinsChangeAmount: coinsDiff,
          date: DateTime.now(),
          isWin: isWin,
          winChance: winChance,
          id: null),
    );
  }
}

import 'dart:math';

import 'package:bidder_game/constants.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_models/record_view_model.dart';

class BidderService {
  final double _fee = 0.02;

  int currentCoins = 100;

  double calculateReward(int bidAmount, double winChance) {
    if (bidAmount == null || winChance == null) {
      return null;
    }
    return (bidAmount / winChance) * (1 - _fee);
  }

  int tryParseAndValidateUserBid(String bid) {
    final userBid = int.tryParse(bid);
    if (currentCoins == null || userBid == null) {
      return null;
    }

    if (currentCoins < userBid) {
      return null;
    }

    return userBid;
  }

  Future<RecordViewModel> play(
      double winChance, int userBid, AppDatabase db) async {
    Random random = new Random();
    var randomNum = random.nextDouble();

    bool isWin = randomNum <= winChance;
    final coinsBefore = currentCoins;
    final reward = calculateReward(userBid, winChance);
    isWin ? currentCoins += reward.toInt() - userBid : currentCoins -= userBid;

    Record record = await insertNewRecord(
      db: db,
      bid: userBid,
      coinsBefore: coinsBefore,
      coinsAfter: currentCoins,
      coinsDiff: (coinsBefore - currentCoins).abs(),
      isWin: isWin,
      winChance: winChance,
    );
    saveCoinsInSP(currentCoins);
    return RecordViewModel.fromRecord(record);
  }

  // Future<List<RecordViewModel>> getAllDb(AppDatabase db) async {
  //   List<Record> recordList = await db.recordsDao.getAll();
  //   return recordList.map((e) => RecordViewModel.fromRecord(e)).toList();
  // }

  Stream<List<RecordViewModel>> watchAll(AppDatabase db) {
    return db.recordsDao.watchAll().map(
        (events) => events.map((e) => RecordViewModel.fromRecord(e)).toList());
  }

  Future<Record> insertNewRecord(
      {AppDatabase db,
      bid,
      coinsAfter,
      coinsBefore,
      coinsDiff,
      isWin,
      winChance}) async {
    final record = Record(
        bidAmount: bid,
        coinsAfterMatch: coinsAfter,
        coinsBeforeMatch: coinsBefore,
        coinsChangeAmount: coinsDiff,
        date: DateTime.now().toLocal(),
        isWin: isWin,
        winChance: winChance,
        id: null);
    await db.recordsDao.insertRecord(record);
    return record;
  }

  void saveCoinsInSP(coinsAmount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(coinsString, coinsAmount);
  }

  Future<int> getCoinsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int coins = prefs.getInt(coinsString);
    if (coins == null) {
      saveCoinsInSP(100);
    }
    currentCoins = coins ?? 100;
    return coins;
  }
}

import 'dart:math';

import 'package:bidder_game/constants.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_models/record_view_model.dart';

class BidderService {
  final double _fee = 0.02;

  double calculateReward(int bidAmount, double winChance) {
    if (bidAmount == null || winChance == null) {
      return null;
    }
    return ((bidAmount / winChance) * (1 - _fee)) - bidAmount;
  }

  int tryParseAndValidateUserBid(String bid) {
    final userBid = int.tryParse(bid);
    if (userBid == null) {
      return null;
    }

    return userBid;
  }

  Future<int> play(
      double winChance, int userBid, AppDatabase db, int coins) async {
    Random random = new Random();
    var randomNum = random.nextDouble();

    bool isWin = randomNum <= winChance;
    final coinsBefore = coins;
    final reward = calculateReward(userBid, winChance);
    isWin ? coins += reward.toInt() : coins -= userBid;

    await insertNewRecord(
      db: db,
      bid: userBid,
      coinsBefore: coinsBefore,
      coinsAfter: coins,
      coinsDiff: (coinsBefore - coins).abs(),
      isWin: isWin,
      winChance: winChance,
    );
    saveCoinsInSP(coins);

    return coins;
  }

  Stream<List<RecordViewModel>> watchAll(AppDatabase db) {
    return db.recordsDao.watchAll().map(
        (events) => events.map((e) => RecordViewModel.fromRecord(e)).toList());
  }

  Future<List<RecordViewModel>> getAll(AppDatabase db) async {
    return (await db.recordsDao.getAll())
        .map((e) => RecordViewModel.fromRecord(e))
        .toList();
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
      coins = 100;
    }

    return coins;
  }

  Future<dynamic> deleteAlldb(AppDatabase db) async {
    await db.recordsDao.deleteRecord();
  }
}

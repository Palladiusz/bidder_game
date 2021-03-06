import 'package:bidder_game/data/moor_database.dart';

class RecordViewModel {
  final DateTime date;
  final String bid;
  final String coinsAfter;
  final String coinsBefore;
  final String coinsDiff;
  final bool isWin;
  final String winChance;

  RecordViewModel(
      {this.date,
      this.bid,
      this.coinsAfter,
      this.coinsBefore,
      this.coinsDiff,
      this.isWin,
      this.winChance});

  RecordViewModel.fromRecord(Record record)
      : isWin = record.isWin,
        bid = record.bidAmount.toString(),
        date = record.date,
        coinsAfter = record.coinsAfterMatch.toString(),
        coinsBefore = record.coinsBeforeMatch.toString(),
        coinsDiff = (record.coinsChangeAmount).abs().toString(),
        winChance = '${(record.winChance * 100).floor()}%';
}

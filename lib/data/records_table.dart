import 'package:moor_flutter/moor_flutter.dart';

class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isWin => boolean()();
  IntColumn get bidAmount => integer()();
  RealColumn get winChance => real()();
  IntColumn get coinsBeforeMatch => integer()();
  IntColumn get coinsAfterMatch => integer()();
  IntColumn get coinsChangeAmount => integer()();
}

import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'records_dao.dart';

part 'moor_database.g.dart';

//TODO Review: Please declare Records table in separate file
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

@UseMoor(tables: [Records], daos: [RecordsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

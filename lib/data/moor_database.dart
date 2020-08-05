import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isWin => boolean()();
  IntColumn get bidAmount => integer()();
  IntColumn get winChance => integer()();
  IntColumn get coinsBeforeMatch => integer()();
  IntColumn get coinsAfterMatch => integer()();
  IntColumn get coinsChangeAmount => integer()();
}

// Datę i czas rozgrywki -
// Wygrana/Przegrana -
// Wysokość zakładu -
// Szansa na wygraną -
// Saldo przed grą -
// Saldo po grze -
// Zmiana salda -

@UseMoor(tables: [Records])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Record>> getAll() => select(records).get();
  Stream<List<Record>> watchAll() => select(records).watch();
  Future insertRecord(Record entity) => into(records).insert(entity);
  Future updateRecord(Record entity) => update(records).replace(entity);
  Future deleteRecord(Record entity) => delete(records).delete(entity);
}

import 'package:bidder_game/data/moor_database.dart';

import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'records_dao.g.dart';

@UseDao(tables: [Records])
class RecordsDao extends DatabaseAccessor<AppDatabase> with _$RecordsDaoMixin {
  RecordsDao(AppDatabase db) : super(db);

  Future<List<Record>> getAll() => (select(records)
        ..orderBy(
            [(u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc)]))
      .get();

  Stream<List<Record>> watchAll() {
    return (select(records)
          ..orderBy(
              [(u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc)]))
        .watch();
  }

  //TODO Review: Please ALWAYS declare of type returned by Future, now it is Future<dynamic> which is bad
  Future insertRecord(Record entity) => into(records).insert(entity);

  //TODO Review: Please ALWAYS declare of type returned by Future, now it is Future<dynamic> which is bad
  Future updateRecord(Record entity) => update(records).replace(entity);

  //TODO Review: Please ALWAYS declare of type returned by Future, now it is Future<dynamic> which is bad
  Future deleteRecord() => delete(records).go();
}

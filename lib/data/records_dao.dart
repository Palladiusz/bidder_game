import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/view_models/record_view_model.dart';
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

  Future insertRecord(Record entity) => into(records).insert(entity);
  Future updateRecord(Record entity) => update(records).replace(entity);
  Future deleteRecord() => delete(records).go();
}

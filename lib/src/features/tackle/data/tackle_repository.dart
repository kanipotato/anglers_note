import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';

class TackleRepository {
  TackleRepository(this._db);

  final AppDatabase _db;

  Stream<List<Tackle>> watchAll() {
    return (_db.select(_db.tackles)
          ..where((t) => t.isDeleted.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.category)]))
        .watch();
  }

  Future<void> upsert({
    String? id,
    required String category,
    required String name,
    String? memo,
  }) async {
    final now = DateTime.now();
    if (id == null) {
      await _db.into(_db.tackles).insert(TacklesCompanion.insert(
            id: const Uuid().v4(),
            category: category,
            name: name,
            memo: Value(memo),
            updatedAt: now,
          ));
    } else {
      await (_db.update(_db.tackles)..where((t) => t.id.equals(id))).write(
        TacklesCompanion(
          category: Value(category),
          name: Value(name),
          memo: Value(memo),
          updatedAt: Value(now),
        ),
      );
    }
  }

  Future<void> delete(String id) async {
    await (_db.update(_db.tackles)..where((t) => t.id.equals(id))).write(
      TacklesCompanion(isDeleted: const Value(true), updatedAt: Value(DateTime.now())),
    );
  }
}

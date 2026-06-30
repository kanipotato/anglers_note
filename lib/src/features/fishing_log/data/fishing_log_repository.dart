import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';

class FishingLogRepository {
  FishingLogRepository(this._db);

  final AppDatabase _db;

  Stream<List<FishingLog>> watchAll() {
    return (_db.select(_db.fishingLogs)
          ..where((t) => t.isDeleted.equals(false))
          ..orderBy([(t) => OrderingTerm.desc(t.loggedAt)]))
        .watch();
  }

  Stream<FishingLog> watchById(String id) {
    return (_db.select(_db.fishingLogs)..where((t) => t.id.equals(id)))
        .watchSingle();
  }

  Stream<List<CatchRecord>> watchCatchesForLog(String fishingLogId) {
    return (_db.select(_db.catchRecords)
          ..where((t) =>
              t.fishingLogId.equals(fishingLogId) & t.isDeleted.equals(false)))
        .watch();
  }

  Stream<CatchRecord> watchCatchById(String id) {
    return (_db.select(_db.catchRecords)..where((t) => t.id.equals(id))).watchSingle();
  }

  Stream<List<CatchRecord>> watchAllCatches() {
    return (_db.select(_db.catchRecords)
          ..where((t) => t.isDeleted.equals(false))
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .watch();
  }

  Future<String> createLog({
    required DateTime loggedAt,
    required String locationName,
    String? locationLabel,
    double? latitude,
    double? longitude,
    String? weather,
    String? tide,
    double? temperature,
    String? memo,
  }) async {
    final id = const Uuid().v4();
    await _db.into(_db.fishingLogs).insert(FishingLogsCompanion.insert(
          id: id,
          loggedAt: loggedAt,
          locationName: locationName,
          locationLabel: Value(locationLabel),
          latitude: Value(latitude),
          longitude: Value(longitude),
          weather: Value(weather),
          tide: Value(tide),
          temperature: Value(temperature),
          memo: Value(memo),
          updatedAt: DateTime.now(),
        ));
    return id;
  }

  Future<void> deleteLog(String id) async {
    final now = DateTime.now();
    await _db.transaction(() async {
      await (_db.update(_db.fishingLogs)..where((t) => t.id.equals(id))).write(
        FishingLogsCompanion(isDeleted: const Value(true), updatedAt: Value(now)),
      );
      await (_db.update(_db.catchRecords)
            ..where((t) => t.fishingLogId.equals(id)))
          .write(
        CatchRecordsCompanion(isDeleted: const Value(true), updatedAt: Value(now)),
      );
    });
  }

  Future<void> addCatch({
    required String fishingLogId,
    required String species,
    double? sizeCm,
    double? weightG,
    String? method,
    String? methodDetail,
    String? tackleId,
    DateTime? hitTime,
    String? photoPath,
    String? memo,
  }) async {
    await _db.into(_db.catchRecords).insert(CatchRecordsCompanion.insert(
          id: const Uuid().v4(),
          fishingLogId: fishingLogId,
          species: species,
          sizeCm: Value(sizeCm),
          weightG: Value(weightG),
          method: Value(method),
          methodDetail: Value(methodDetail),
          tackleId: Value(tackleId),
          hitTime: Value(hitTime),
          photoPath: Value(photoPath),
          memo: Value(memo),
          updatedAt: DateTime.now(),
        ));
  }

  Future<void> deleteCatch(String id) async {
    await (_db.update(_db.catchRecords)..where((t) => t.id.equals(id))).write(
      CatchRecordsCompanion(isDeleted: const Value(true), updatedAt: Value(DateTime.now())),
    );
  }

  Stream<List<SpeciesRankingEntry>> watchSpeciesRanking({required DateTime since}) {
    final speciesCol = _db.catchRecords.species;
    final countExp = _db.catchRecords.id.count();
    final query = _db.selectOnly(_db.catchRecords)
      ..addColumns([speciesCol, countExp])
      ..join([
        innerJoin(
          _db.fishingLogs,
          _db.fishingLogs.id.equalsExp(_db.catchRecords.fishingLogId),
        ),
      ])
      ..where(_db.catchRecords.isDeleted.equals(false) &
          _db.fishingLogs.isDeleted.equals(false) &
          _db.fishingLogs.loggedAt.isBiggerOrEqualValue(since))
      ..groupBy([speciesCol])
      ..orderBy([OrderingTerm.desc(countExp)]);

    return query.watch().map(
          (rows) => rows
              .map((row) => SpeciesRankingEntry(
                    species: row.read(speciesCol)!,
                    count: row.read(countExp) ?? 0,
                  ))
              .toList(),
        );
  }
}

class SpeciesRankingEntry {
  SpeciesRankingEntry({required this.species, required this.count});

  final String species;
  final int count;
}

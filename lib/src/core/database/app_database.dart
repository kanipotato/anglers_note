import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class FishingLogs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get loggedAt => dateTime()();
  TextColumn get locationName => text()();
  TextColumn get locationLabel => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get weather => text().nullable()();
  TextColumn get tide => text().nullable()();
  RealColumn get temperature => real().nullable()();
  TextColumn get memo => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class CatchRecords extends Table {
  TextColumn get id => text()();
  TextColumn get fishingLogId => text().references(FishingLogs, #id)();
  TextColumn get species => text()();
  RealColumn get sizeCm => real().nullable()();
  RealColumn get weightG => real().nullable()();
  TextColumn get method => text().nullable()();
  TextColumn get methodDetail => text().nullable()();
  TextColumn get tackleId => text().nullable().references(Tackles, #id)();
  DateTimeColumn get hitTime => dateTime().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get memo => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Tackles extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  TextColumn get name => text()();
  TextColumn get memo => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [FishingLogs, CatchRecords, Tackles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  // リリース前の開発段階のため、スキーマ変更時は全テーブルを作り直す。
  // 実ユーザーのデータが入った後は、ここをちゃんとしたマイグレーションに置き換えること。
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          await m.database.customStatement('DROP TABLE IF EXISTS catch_records');
          await m.database.customStatement('DROP TABLE IF EXISTS fishing_logs');
          await m.database.customStatement('DROP TABLE IF EXISTS tackles');
          await m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'anglers_note.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

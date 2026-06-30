import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../data/fishing_log_repository.dart';
import '../data/fishing_log_repository_provider.dart';

final fishingLogListProvider = StreamProvider<List<FishingLog>>((ref) {
  return ref.watch(fishingLogRepositoryProvider).watchAll();
});

final fishingLogDetailProvider = StreamProvider.family<FishingLog, String>((ref, id) {
  return ref.watch(fishingLogRepositoryProvider).watchById(id);
});

final catchRecordsForLogProvider =
    StreamProvider.family<List<CatchRecord>, String>((ref, fishingLogId) {
  return ref.watch(fishingLogRepositoryProvider).watchCatchesForLog(fishingLogId);
});

final catchRecordDetailProvider = StreamProvider.family<CatchRecord, String>((ref, catchId) {
  return ref.watch(fishingLogRepositoryProvider).watchCatchById(catchId);
});

final allCatchRecordsProvider = StreamProvider<List<CatchRecord>>((ref) {
  return ref.watch(fishingLogRepositoryProvider).watchAllCatches();
});

final speciesRankingProvider = StreamProvider<List<SpeciesRankingEntry>>((ref) {
  final since = DateTime.now().subtract(const Duration(days: 90));
  return ref.watch(fishingLogRepositoryProvider).watchSpeciesRanking(since: since);
});

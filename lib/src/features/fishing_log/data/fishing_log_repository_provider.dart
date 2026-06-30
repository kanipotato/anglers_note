import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import 'fishing_log_repository.dart';

final fishingLogRepositoryProvider = Provider<FishingLogRepository>((ref) {
  return FishingLogRepository(ref.watch(appDatabaseProvider));
});

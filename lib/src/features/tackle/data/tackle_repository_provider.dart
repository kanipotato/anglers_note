import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import 'tackle_repository.dart';

final tackleRepositoryProvider = Provider<TackleRepository>((ref) {
  return TackleRepository(ref.watch(appDatabaseProvider));
});

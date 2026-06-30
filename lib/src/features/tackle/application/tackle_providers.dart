import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../data/tackle_repository_provider.dart';

final tackleListProvider = StreamProvider<List<Tackle>>((ref) {
  return ref.watch(tackleRepositoryProvider).watchAll();
});

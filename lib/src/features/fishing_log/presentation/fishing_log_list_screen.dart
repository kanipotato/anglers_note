import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../application/fishing_log_providers.dart';

class FishingLogListScreen extends ConsumerWidget {
  const FishingLogListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(fishingLogListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('釣行一覧')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/logs/new'),
        child: const Icon(Icons.add),
      ),
      body: logsAsync.when(
        data: (logs) => logs.isEmpty
            ? const Center(child: Text('まだ釣行記録がありません'))
            : ListView.separated(
                itemCount: logs.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final log = logs[index];
                  final dateLabel = DateFormat('yyyy/MM/dd HH:mm').format(log.loggedAt);
                  return ListTile(
                    title: Text(log.locationName),
                    subtitle: Text(
                      log.locationLabel != null
                          ? '$dateLabel ・ ${log.locationLabel}'
                          : dateLabel,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/logs/${log.id}'),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('読み込みエラー: $e')),
      ),
    );
  }
}

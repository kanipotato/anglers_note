import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../application/fishing_log_providers.dart';
import '../data/fishing_log_repository_provider.dart';

class FishingLogDetailScreen extends ConsumerWidget {
  const FishingLogDetailScreen({required this.id, super.key});

  final String id;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('この釣行を削除しますか？'),
        content: const Text('紐づく釣果も合わせて削除されます。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('削除'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(fishingLogRepositoryProvider).deleteLog(id);
      if (context.mounted) context.go('/logs');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logAsync = ref.watch(fishingLogDetailProvider(id));
    final catchesAsync = ref.watch(catchRecordsForLogProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('釣行詳細'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: logAsync.when(
        data: (log) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              DateFormat('yyyy/MM/dd HH:mm').format(log.loggedAt),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (log.locationLabel != null)
              Text(
                log.locationLabel!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            Text(log.locationName, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                if (log.weather != null) Chip(label: Text(log.weather!)),
                if (log.tide != null) Chip(label: Text(log.tide!)),
                if (log.temperature != null)
                  Chip(label: Text('${log.temperature!.toStringAsFixed(1)}℃')),
              ],
            ),
            if (log.memo != null && log.memo!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(log.memo!),
            ],
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('釣果', style: Theme.of(context).textTheme.titleMedium),
                FilledButton.icon(
                  onPressed: () => context.push('/logs/$id/catches/new'),
                  icon: const Icon(Icons.add),
                  label: const Text('魚を追加'),
                ),
              ],
            ),
            catchesAsync.when(
              data: (catches) => catches.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text('まだ釣果が登録されていません'),
                    )
                  : Column(
                      children: catches
                          .map(
                            (c) => Dismissible(
                              key: ValueKey(c.id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.redAccent,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 16),
                                child: const Icon(Icons.delete, color: Colors.white),
                              ),
                              onDismissed: (_) =>
                                  ref.read(fishingLogRepositoryProvider).deleteCatch(c.id),
                              child: ListTile(
                                leading: const Icon(Icons.set_meal),
                                title: Text(c.species),
                                subtitle: Text(
                                  [
                                    if (c.sizeCm != null) '${c.sizeCm!.toStringAsFixed(1)}cm',
                                    if (c.methodDetail != null) c.methodDetail!,
                                  ].join(' / '),
                                ),
                                onTap: () => context.push('/logs/$id/catches/${c.id}'),
                              ),
                            ),
                          )
                          .toList(),
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('読み込みエラー: $e'),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('読み込みエラー: $e')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../application/fishing_log_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(fishingLogListProvider);
    final catchesAsync = ref.watch(allCatchRecordsProvider);
    final rankingAsync = ref.watch(speciesRankingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Anglers Note')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: '釣行数',
                  value: logsAsync.maybeWhen(
                    data: (l) => l.length.toString(),
                    orElse: () => '-',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  label: '釣果数',
                  value: catchesAsync.maybeWhen(
                    data: (c) => c.length.toString(),
                    orElse: () => '-',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('最近の釣果', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          catchesAsync.when(
            data: (catches) => catches.isEmpty
                ? const Text('まだ釣果がありません')
                : Column(
                    children: catches
                        .take(5)
                        .map(
                          (c) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.set_meal),
                            title: Text(c.species),
                            subtitle: Text(DateFormat('yyyy/MM/dd').format(c.updatedAt)),
                            onTap: () => context.push('/logs/${c.fishingLogId}'),
                          ),
                        )
                        .toList(),
                  ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('読み込みエラー: $e'),
          ),
          const SizedBox(height: 24),
          Text('過去3ヶ月の釣果ランキング', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          rankingAsync.when(
            data: (ranking) => ranking.isEmpty
                ? const Text('まだ釣果がありません')
                : Column(
                    children: ranking.asMap().entries.map((entry) {
                      final rank = entry.key + 1;
                      final item = entry.value;
                      final ratio = item.count / ranking.first.count;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            SizedBox(width: 28, child: Text('$rank位')),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.species),
                                  const SizedBox(height: 4),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: ratio,
                                      minHeight: 6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text('${item.count}匹'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('読み込みエラー: $e'),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => context.push('/logs/new'),
            icon: const Icon(Icons.add),
            label: const Text('釣行を記録する'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
            Text(label),
          ],
        ),
      ),
    );
  }
}

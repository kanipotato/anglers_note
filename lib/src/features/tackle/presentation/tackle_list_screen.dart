import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/tackle_providers.dart';
import '../data/tackle_repository_provider.dart';

class TackleListScreen extends ConsumerWidget {
  const TackleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tacklesAsync = ref.watch(tackleListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('タックル')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/tackles/new'),
        child: const Icon(Icons.add),
      ),
      body: tacklesAsync.when(
        data: (tackles) => tackles.isEmpty
            ? const Center(child: Text('まだタックルが登録されていません'))
            : ListView.separated(
                itemCount: tackles.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final tackle = tackles[index];
                  return Dismissible(
                    key: ValueKey(tackle.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.redAccent,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) => ref.read(tackleRepositoryProvider).delete(tackle.id),
                    child: ListTile(
                      leading: Chip(label: Text(tackle.category)),
                      title: Text(tackle.name),
                      subtitle: tackle.memo != null ? Text(tackle.memo!) : null,
                      onTap: () => context.push('/tackles/${tackle.id}/edit', extra: tackle),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('読み込みエラー: $e')),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../tackle/application/tackle_providers.dart';
import '../application/fishing_log_providers.dart';
import '../data/fishing_log_repository_provider.dart';

class CatchRecordDetailScreen extends ConsumerWidget {
  const CatchRecordDetailScreen({required this.catchId, super.key});

  final String catchId;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('この釣果を削除しますか？'),
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
      await ref.read(fishingLogRepositoryProvider).deleteCatch(catchId);
      if (context.mounted) context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catchAsync = ref.watch(catchRecordDetailProvider(catchId));
    final tacklesAsync = ref.watch(tackleListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('釣果詳細'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: catchAsync.when(
        data: (c) {
          final tackleName = tacklesAsync.maybeWhen(
            data: (tackles) {
              if (c.tackleId == null) return null;
              for (final t in tackles) {
                if (t.id == c.tackleId) return '${t.category} / ${t.name}';
              }
              return null;
            },
            orElse: () => null,
          );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (c.photoPath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(File(c.photoPath!), height: 220, fit: BoxFit.cover),
                ),
              const SizedBox(height: 12),
              Text(c.species, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (c.sizeCm != null) Chip(label: Text('${c.sizeCm!.toStringAsFixed(1)}cm')),
                  if (c.weightG != null) Chip(label: Text('${c.weightG!.toStringAsFixed(0)}g')),
                  if (c.method != null) Chip(label: Text(c.method!)),
                ],
              ),
              if (c.methodDetail != null && c.methodDetail!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text('詳細: ${c.methodDetail!}'),
              ],
              if (tackleName != null) ...[
                const SizedBox(height: 8),
                Text('タックル: $tackleName'),
              ],
              if (c.hitTime != null) ...[
                const SizedBox(height: 8),
                Text('ヒット時間: ${TimeOfDay.fromDateTime(c.hitTime!).format(context)}'),
              ],
              if (c.memo != null && c.memo!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(c.memo!),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('読み込みエラー: $e')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/app_database.dart';
import '../data/tackle_repository_provider.dart';

class TackleFormScreen extends ConsumerStatefulWidget {
  const TackleFormScreen({this.tackle, super.key});

  final Tackle? tackle;

  @override
  ConsumerState<TackleFormScreen> createState() => _TackleFormScreenState();
}

class _TackleFormScreenState extends ConsumerState<TackleFormScreen> {
  static const _categoryOptions = ['ロッド', 'リール', 'ライン', 'ルアー'];

  final _formKey = GlobalKey<FormState>();
  late final _nameController = TextEditingController(text: widget.tackle?.name);
  late final _memoController = TextEditingController(text: widget.tackle?.memo);
  late String _category = widget.tackle?.category ?? _categoryOptions.first;

  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    await ref.read(tackleRepositoryProvider).upsert(
          id: widget.tackle?.id,
          category: _category,
          name: _nameController.text.trim(),
          memo: _memoController.text.trim().isEmpty ? null : _memoController.text.trim(),
        );
    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.tackle == null ? 'タックルを登録' : 'タックルを編集')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<String>(
              initialValue: _category,
              decoration: const InputDecoration(labelText: '種類'),
              items:
                  _categoryOptions.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _category = v ?? _category),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '名称'),
              validator: (v) => (v == null || v.trim().isEmpty) ? '必須項目です' : null,
            ),
            TextFormField(
              controller: _memoController,
              decoration: const InputDecoration(labelText: 'メモ'),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isSaving ? null : _save,
              child: _isSaving
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}

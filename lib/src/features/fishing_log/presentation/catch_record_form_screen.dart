import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/form_validators.dart';
import '../../tackle/application/tackle_providers.dart';
import '../data/fishing_log_repository_provider.dart';

class CatchRecordFormScreen extends ConsumerStatefulWidget {
  const CatchRecordFormScreen({required this.fishingLogId, super.key});

  final String fishingLogId;

  @override
  ConsumerState<CatchRecordFormScreen> createState() => _CatchRecordFormScreenState();
}

class _CatchRecordFormScreenState extends ConsumerState<CatchRecordFormScreen> {
  static const _methodOptions = ['ルアー', 'エサ', 'その他'];
  static const _methodDetailLabels = {
    'ルアー': 'ルアー名',
    'エサ': 'エサの種類',
    'その他': '詳細',
  };

  final _formKey = GlobalKey<FormState>();
  final _speciesController = TextEditingController();
  final _sizeController = TextEditingController();
  final _weightController = TextEditingController();
  final _methodDetailController = TextEditingController();
  final _memoController = TextEditingController();

  String _method = _methodOptions.first;
  String? _tackleId;
  TimeOfDay? _hitTime;
  String? _photoPath;
  bool _isSaving = false;

  @override
  void dispose() {
    _speciesController.dispose();
    _sizeController.dispose();
    _weightController.dispose();
    _methodDetailController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source, maxWidth: 1600);
    if (picked == null) return;
    setState(() => _photoPath = picked.path);
  }

  Future<void> _pickHitTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _hitTime ?? TimeOfDay.now(),
    );
    if (time != null) setState(() => _hitTime = time);
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    DateTime? hitDateTime;
    if (_hitTime != null) {
      final now = DateTime.now();
      hitDateTime = DateTime(now.year, now.month, now.day, _hitTime!.hour, _hitTime!.minute);
    }
    await ref.read(fishingLogRepositoryProvider).addCatch(
          fishingLogId: widget.fishingLogId,
          species: _speciesController.text.trim(),
          sizeCm: double.tryParse(_sizeController.text),
          weightG: double.tryParse(_weightController.text),
          method: _method,
          methodDetail:
              _methodDetailController.text.trim().isEmpty ? null : _methodDetailController.text.trim(),
          tackleId: _tackleId,
          hitTime: hitDateTime,
          photoPath: _photoPath,
          memo: _memoController.text.trim().isEmpty ? null : _memoController.text.trim(),
        );
    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final tacklesAsync = ref.watch(tackleListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('釣果を追加')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_photoPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(File(_photoPath!), height: 160, fit: BoxFit.cover),
              ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => _pickPhoto(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('撮影'),
                ),
                TextButton.icon(
                  onPressed: () => _pickPhoto(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: const Text('選択'),
                ),
              ],
            ),
            TextFormField(
              controller: _speciesController,
              decoration: const InputDecoration(labelText: '魚種'),
              maxLength: 30,
              validator: (v) => (v == null || v.trim().isEmpty) ? '必須項目です' : null,
            ),
            TextFormField(
              controller: _sizeController,
              decoration: const InputDecoration(labelText: 'サイズ(cm)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
              maxLength: 6,
              validator: (v) => numericRangeValidator(v, min: 0, max: 500),
            ),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: '重量(g)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
              maxLength: 7,
              validator: (v) => numericRangeValidator(v, min: 0, max: 500000),
            ),
            DropdownButtonFormField<String>(
              initialValue: _method,
              decoration: const InputDecoration(labelText: '釣法'),
              items: _methodOptions.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              onChanged: (v) => setState(() => _method = v ?? _method),
            ),
            TextFormField(
              controller: _methodDetailController,
              decoration: InputDecoration(labelText: _methodDetailLabels[_method]),
              maxLength: 30,
            ),
            tacklesAsync.when(
              data: (tackles) => tackles.isEmpty
                  ? const SizedBox.shrink()
                  : DropdownButtonFormField<String?>(
                      initialValue: _tackleId,
                      decoration: const InputDecoration(labelText: 'タックル'),
                      items: [
                        const DropdownMenuItem(value: null, child: Text('選択しない')),
                        ...tackles.map(
                          (t) => DropdownMenuItem(value: t.id, child: Text('${t.category} / ${t.name}')),
                        ),
                      ],
                      onChanged: (v) => setState(() => _tackleId = v),
                    ),
              loading: () => const SizedBox.shrink(),
              error: (e, st) => const SizedBox.shrink(),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('ヒット時間'),
              subtitle: Text(_hitTime?.format(context) ?? '未設定'),
              trailing: const Icon(Icons.access_time),
              onTap: _pickHitTime,
            ),
            TextFormField(
              controller: _memoController,
              decoration: const InputDecoration(labelText: 'メモ'),
              maxLines: 3,
              maxLength: 200,
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

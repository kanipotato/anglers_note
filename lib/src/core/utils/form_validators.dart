String? numericRangeValidator(
  String? value, {
  required double min,
  required double max,
  bool required = false,
}) {
  if (value == null || value.trim().isEmpty) {
    return required ? '必須項目です' : null;
  }
  final parsed = double.tryParse(value);
  if (parsed == null) return '数値を入力してください';
  if (parsed < min || parsed > max) return '$min〜$maxの範囲で入力してください';
  return null;
}

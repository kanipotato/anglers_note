import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/services/geo_weather_service.dart';
import '../../../core/utils/form_validators.dart';
import '../data/fishing_log_repository_provider.dart';

class FishingLogFormScreen extends ConsumerStatefulWidget {
  const FishingLogFormScreen({super.key});

  @override
  ConsumerState<FishingLogFormScreen> createState() => _FishingLogFormScreenState();
}

class _FishingLogFormScreenState extends ConsumerState<FishingLogFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _temperatureController = TextEditingController();
  final _memoController = TextEditingController();

  final _geoWeatherService = GeoWeatherService();

  DateTime _dateTime = DateTime.now();
  String? _tide;
  String? _weather;
  double? _latitude;
  double? _longitude;
  String? _locationLabel;
  bool _isSaving = false;
  bool _isLocating = false;
  bool _locationFetchFailed = false;
  bool _temperatureIsAutoFilled = false;

  static const _tideOptions = ['大潮', '中潮', '小潮', '長潮', '若潮'];
  static const _weatherOptions = ['晴れ', '曇り', '雨', '雪'];

  @override
  void dispose() {
    _locationController.dispose();
    _temperatureController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    if (!mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );
    if (time == null) return;
    setState(() {
      _dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future<void> _useCurrentLocation() async {
    setState(() {
      _isLocating = true;
      _locationFetchFailed = false;
    });
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });

      final results = await Future.wait([
        _geoWeatherService.reverseGeocodeJapan(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
        _geoWeatherService.fetchAverageTemperature(
          latitude: position.latitude,
          longitude: position.longitude,
          date: _dateTime,
        ),
      ]);
      final label = results[0] as String?;
      final avgTemp = results[1] as double?;

      if (!mounted) return;
      setState(() {
        _locationLabel = label;
        _locationFetchFailed = label == null;
        if (avgTemp != null && _temperatureController.text.trim().isEmpty) {
          _temperatureController.text = avgTemp.toStringAsFixed(1);
          _temperatureIsAutoFilled = true;
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('現在地の取得に失敗しました: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLocating = false);
    }
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    final repository = ref.read(fishingLogRepositoryProvider);
    final id = await repository.createLog(
      loggedAt: _dateTime,
      locationName: _locationController.text.trim(),
      locationLabel: _locationLabel,
      latitude: _latitude,
      longitude: _longitude,
      weather: _weather,
      tide: _tide,
      temperature: double.tryParse(_temperatureController.text),
      memo: _memoController.text.trim().isEmpty ? null : _memoController.text.trim(),
    );
    if (!mounted) return;
    context.pushReplacement('/logs/$id');
  }

  @override
  Widget build(BuildContext context) {
    final dateLabel = DateFormat('yyyy/MM/dd HH:mm').format(_dateTime);
    return Scaffold(
      appBar: AppBar(title: const Text('釣行を記録')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('日時'),
              subtitle: Text(dateLabel),
              trailing: const Icon(Icons.edit_calendar),
              onTap: _pickDateTime,
            ),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: '場所名'),
              maxLength: 50,
              validator: (v) => (v == null || v.trim().isEmpty) ? '必須項目です' : null,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _locationLabel ??
                        (_locationFetchFailed
                            ? '位置情報は取得済み（地名への変換に失敗）'
                            : _latitude != null
                                ? '位置情報取得済み'
                                : '位置情報未取得'),
                  ),
                ),
                if (_isLocating)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                else
                  TextButton.icon(
                    onPressed: _useCurrentLocation,
                    icon: const Icon(Icons.my_location),
                    label: const Text('現在地'),
                  ),
              ],
            ),
            DropdownButtonFormField<String>(
              initialValue: _weather,
              decoration: const InputDecoration(labelText: '天候'),
              items:
                  _weatherOptions.map((w) => DropdownMenuItem(value: w, child: Text(w))).toList(),
              onChanged: (v) => setState(() => _weather = v),
            ),
            DropdownButtonFormField<String>(
              initialValue: _tide,
              decoration: const InputDecoration(labelText: '潮'),
              items: _tideOptions.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => setState(() => _tide = v),
            ),
            TextFormField(
              controller: _temperatureController,
              decoration: InputDecoration(
                labelText: '気温(℃)',
                helperText: _temperatureIsAutoFilled ? '気象データから自動入力（編集可）' : null,
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d{0,1}'))],
              maxLength: 6,
              onChanged: (_) {
                if (_temperatureIsAutoFilled) {
                  setState(() => _temperatureIsAutoFilled = false);
                }
              },
              validator: (v) => numericRangeValidator(v, min: -50, max: 50),
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

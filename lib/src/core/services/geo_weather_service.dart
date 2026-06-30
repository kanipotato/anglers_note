import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

/// 緯度経度から「都道府県＋市区町村」レベルの地名、および訪問日の平均気温を取得するサービス。
///
/// どちらもAPIキー不要・無料の公開APIを使用する:
/// - 地名: 国土地理院 逆ジオコーディングAPI（日本国内のみ対応）
/// - 気温: Open-Meteo（過去日はArchive API、直近〜将来日はForecast APIを使い分け）
///
/// 取得に失敗した場合は例外を投げず null を返す。呼び出し側は「自動取得できなければ
/// 手入力に委ねる（ノイズになる推定値は出さない）」という方針で扱うこと。
class GeoWeatherService {
  static const _prefectureNames = {
    '01': '北海道', '02': '青森県', '03': '岩手県', '04': '宮城県', '05': '秋田県',
    '06': '山形県', '07': '福島県', '08': '茨城県', '09': '栃木県', '10': '群馬県',
    '11': '埼玉県', '12': '千葉県', '13': '東京都', '14': '神奈川県', '15': '新潟県',
    '16': '富山県', '17': '石川県', '18': '福井県', '19': '山梨県', '20': '長野県',
    '21': '岐阜県', '22': '静岡県', '23': '愛知県', '24': '三重県', '25': '滋賀県',
    '26': '京都府', '27': '大阪府', '28': '兵庫県', '29': '奈良県', '30': '和歌山県',
    '31': '鳥取県', '32': '島根県', '33': '岡山県', '34': '広島県', '35': '山口県',
    '36': '徳島県', '37': '香川県', '38': '愛媛県', '39': '高知県', '40': '福岡県',
    '41': '佐賀県', '42': '長崎県', '43': '熊本県', '44': '大分県', '45': '宮崎県',
    '46': '鹿児島県', '47': '沖縄県',
  };

  /// 「東京都新宿区」のような県・市レベルの地名を返す。日本国外や取得失敗時は null。
  Future<String?> reverseGeocodeJapan({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.https(
      'mreversegeocoder.gsi.go.jp',
      '/reverse-geocoder/LonLatToAddress',
      {'lat': latitude.toString(), 'lon': longitude.toString()},
    );
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return null;
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final results = body['results'] as Map<String, dynamic>?;
      final muniCd = results?['muniCd'] as String?;
      final muniName = results?['lv01Nm'] as String?;
      if (muniCd == null || muniName == null || muniCd.length < 2) return null;
      final prefName = _prefectureNames[muniCd.substring(0, 2)];
      if (prefName == null) return null;
      return '$prefName$muniName';
    } catch (_) {
      return null;
    }
  }

  /// 指定地点・指定日の平均気温(℃)を取得する。取得失敗時やデータ無しの場合は null。
  Future<double?> fetchAverageTemperature({
    required double latitude,
    required double longitude,
    required DateTime date,
  }) async {
    final today = DateTime.now();
    final dateOnly = DateTime(date.year, date.month, date.day);
    final todayOnly = DateTime(today.year, today.month, today.day);
    final daysAgo = todayOnly.difference(dateOnly).inDays;

    // Archive APIは確定値だが反映に数日のラグがあるため、直近・将来日はForecast APIを使う。
    final useArchive = daysAgo > 5;
    final host = useArchive ? 'archive-api.open-meteo.com' : 'api.open-meteo.com';
    final dateStr = DateFormat('yyyy-MM-dd').format(dateOnly);

    final uri = Uri.https(host, '/v1/${useArchive ? 'archive' : 'forecast'}', {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'start_date': dateStr,
      'end_date': dateStr,
      'hourly': 'temperature_2m',
      'timezone': 'Asia/Tokyo',
    });

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return null;
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final hourly = body['hourly'] as Map<String, dynamic>?;
      final temps = (hourly?['temperature_2m'] as List<dynamic>?)
          ?.whereType<num>()
          .map((n) => n.toDouble())
          .toList();
      if (temps == null || temps.isEmpty) return null;
      final avg = temps.reduce((a, b) => a + b) / temps.length;
      return double.parse(avg.toStringAsFixed(1));
    } catch (_) {
      return null;
    }
  }
}

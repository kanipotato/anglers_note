// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FishingLogsTable extends FishingLogs
    with TableInfo<$FishingLogsTable, FishingLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FishingLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationLabelMeta = const VerificationMeta(
    'locationLabel',
  );
  @override
  late final GeneratedColumn<String> locationLabel = GeneratedColumn<String>(
    'location_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weatherMeta = const VerificationMeta(
    'weather',
  );
  @override
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
    'weather',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tideMeta = const VerificationMeta('tide');
  @override
  late final GeneratedColumn<String> tide = GeneratedColumn<String>(
    'tide',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
    'temperature',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loggedAt,
    locationName,
    locationLabel,
    latitude,
    longitude,
    weather,
    tide,
    temperature,
    memo,
    updatedAt,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fishing_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<FishingLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationNameMeta);
    }
    if (data.containsKey('location_label')) {
      context.handle(
        _locationLabelMeta,
        locationLabel.isAcceptableOrUnknown(
          data['location_label']!,
          _locationLabelMeta,
        ),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('weather')) {
      context.handle(
        _weatherMeta,
        weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta),
      );
    }
    if (data.containsKey('tide')) {
      context.handle(
        _tideMeta,
        tide.isAcceptableOrUnknown(data['tide']!, _tideMeta),
      );
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FishingLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FishingLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      )!,
      locationLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_label'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      weather: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weather'],
      ),
      tide: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tide'],
      ),
      temperature: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperature'],
      ),
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $FishingLogsTable createAlias(String alias) {
    return $FishingLogsTable(attachedDatabase, alias);
  }
}

class FishingLog extends DataClass implements Insertable<FishingLog> {
  final String id;
  final DateTime loggedAt;
  final String locationName;
  final String? locationLabel;
  final double? latitude;
  final double? longitude;
  final String? weather;
  final String? tide;
  final double? temperature;
  final String? memo;
  final DateTime updatedAt;
  final bool isDeleted;
  const FishingLog({
    required this.id,
    required this.loggedAt,
    required this.locationName,
    this.locationLabel,
    this.latitude,
    this.longitude,
    this.weather,
    this.tide,
    this.temperature,
    this.memo,
    required this.updatedAt,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    map['location_name'] = Variable<String>(locationName);
    if (!nullToAbsent || locationLabel != null) {
      map['location_label'] = Variable<String>(locationLabel);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || weather != null) {
      map['weather'] = Variable<String>(weather);
    }
    if (!nullToAbsent || tide != null) {
      map['tide'] = Variable<String>(tide);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double>(temperature);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  FishingLogsCompanion toCompanion(bool nullToAbsent) {
    return FishingLogsCompanion(
      id: Value(id),
      loggedAt: Value(loggedAt),
      locationName: Value(locationName),
      locationLabel: locationLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(locationLabel),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      weather: weather == null && nullToAbsent
          ? const Value.absent()
          : Value(weather),
      tide: tide == null && nullToAbsent ? const Value.absent() : Value(tide),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory FishingLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FishingLog(
      id: serializer.fromJson<String>(json['id']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      locationName: serializer.fromJson<String>(json['locationName']),
      locationLabel: serializer.fromJson<String?>(json['locationLabel']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      weather: serializer.fromJson<String?>(json['weather']),
      tide: serializer.fromJson<String?>(json['tide']),
      temperature: serializer.fromJson<double?>(json['temperature']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'locationName': serializer.toJson<String>(locationName),
      'locationLabel': serializer.toJson<String?>(locationLabel),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'weather': serializer.toJson<String?>(weather),
      'tide': serializer.toJson<String?>(tide),
      'temperature': serializer.toJson<double?>(temperature),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  FishingLog copyWith({
    String? id,
    DateTime? loggedAt,
    String? locationName,
    Value<String?> locationLabel = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<String?> weather = const Value.absent(),
    Value<String?> tide = const Value.absent(),
    Value<double?> temperature = const Value.absent(),
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    bool? isDeleted,
  }) => FishingLog(
    id: id ?? this.id,
    loggedAt: loggedAt ?? this.loggedAt,
    locationName: locationName ?? this.locationName,
    locationLabel: locationLabel.present
        ? locationLabel.value
        : this.locationLabel,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    weather: weather.present ? weather.value : this.weather,
    tide: tide.present ? tide.value : this.tide,
    temperature: temperature.present ? temperature.value : this.temperature,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  FishingLog copyWithCompanion(FishingLogsCompanion data) {
    return FishingLog(
      id: data.id.present ? data.id.value : this.id,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      locationLabel: data.locationLabel.present
          ? data.locationLabel.value
          : this.locationLabel,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      weather: data.weather.present ? data.weather.value : this.weather,
      tide: data.tide.present ? data.tide.value : this.tide,
      temperature: data.temperature.present
          ? data.temperature.value
          : this.temperature,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FishingLog(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('locationName: $locationName, ')
          ..write('locationLabel: $locationLabel, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('weather: $weather, ')
          ..write('tide: $tide, ')
          ..write('temperature: $temperature, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loggedAt,
    locationName,
    locationLabel,
    latitude,
    longitude,
    weather,
    tide,
    temperature,
    memo,
    updatedAt,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FishingLog &&
          other.id == this.id &&
          other.loggedAt == this.loggedAt &&
          other.locationName == this.locationName &&
          other.locationLabel == this.locationLabel &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.weather == this.weather &&
          other.tide == this.tide &&
          other.temperature == this.temperature &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class FishingLogsCompanion extends UpdateCompanion<FishingLog> {
  final Value<String> id;
  final Value<DateTime> loggedAt;
  final Value<String> locationName;
  final Value<String?> locationLabel;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> weather;
  final Value<String?> tide;
  final Value<double?> temperature;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const FishingLogsCompanion({
    this.id = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.locationName = const Value.absent(),
    this.locationLabel = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.weather = const Value.absent(),
    this.tide = const Value.absent(),
    this.temperature = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FishingLogsCompanion.insert({
    required String id,
    required DateTime loggedAt,
    required String locationName,
    this.locationLabel = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.weather = const Value.absent(),
    this.tide = const Value.absent(),
    this.temperature = const Value.absent(),
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loggedAt = Value(loggedAt),
       locationName = Value(locationName),
       updatedAt = Value(updatedAt);
  static Insertable<FishingLog> custom({
    Expression<String>? id,
    Expression<DateTime>? loggedAt,
    Expression<String>? locationName,
    Expression<String>? locationLabel,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? weather,
    Expression<String>? tide,
    Expression<double>? temperature,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (locationName != null) 'location_name': locationName,
      if (locationLabel != null) 'location_label': locationLabel,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (weather != null) 'weather': weather,
      if (tide != null) 'tide': tide,
      if (temperature != null) 'temperature': temperature,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FishingLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? loggedAt,
    Value<String>? locationName,
    Value<String?>? locationLabel,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String?>? weather,
    Value<String?>? tide,
    Value<double?>? temperature,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return FishingLogsCompanion(
      id: id ?? this.id,
      loggedAt: loggedAt ?? this.loggedAt,
      locationName: locationName ?? this.locationName,
      locationLabel: locationLabel ?? this.locationLabel,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      weather: weather ?? this.weather,
      tide: tide ?? this.tide,
      temperature: temperature ?? this.temperature,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (locationLabel.present) {
      map['location_label'] = Variable<String>(locationLabel.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (tide.present) {
      map['tide'] = Variable<String>(tide.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FishingLogsCompanion(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('locationName: $locationName, ')
          ..write('locationLabel: $locationLabel, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('weather: $weather, ')
          ..write('tide: $tide, ')
          ..write('temperature: $temperature, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TacklesTable extends Tackles with TableInfo<$TacklesTable, Tackle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TacklesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    name,
    memo,
    updatedAt,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tackles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tackle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tackle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tackle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $TacklesTable createAlias(String alias) {
    return $TacklesTable(attachedDatabase, alias);
  }
}

class Tackle extends DataClass implements Insertable<Tackle> {
  final String id;
  final String category;
  final String name;
  final String? memo;
  final DateTime updatedAt;
  final bool isDeleted;
  const Tackle({
    required this.id,
    required this.category,
    required this.name,
    this.memo,
    required this.updatedAt,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  TacklesCompanion toCompanion(bool nullToAbsent) {
    return TacklesCompanion(
      id: Value(id),
      category: Value(category),
      name: Value(name),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory Tackle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tackle(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      name: serializer.fromJson<String>(json['name']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'name': serializer.toJson<String>(name),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  Tackle copyWith({
    String? id,
    String? category,
    String? name,
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    bool? isDeleted,
  }) => Tackle(
    id: id ?? this.id,
    category: category ?? this.category,
    name: name ?? this.name,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  Tackle copyWithCompanion(TacklesCompanion data) {
    return Tackle(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      name: data.name.present ? data.name.value : this.name,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tackle(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, category, name, memo, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tackle &&
          other.id == this.id &&
          other.category == this.category &&
          other.name == this.name &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class TacklesCompanion extends UpdateCompanion<Tackle> {
  final Value<String> id;
  final Value<String> category;
  final Value<String> name;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const TacklesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.name = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TacklesCompanion.insert({
    required String id,
    required String category,
    required String name,
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       category = Value(category),
       name = Value(name),
       updatedAt = Value(updatedAt);
  static Insertable<Tackle> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<String>? name,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (name != null) 'name': name,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TacklesCompanion copyWith({
    Value<String>? id,
    Value<String>? category,
    Value<String>? name,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return TacklesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TacklesCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CatchRecordsTable extends CatchRecords
    with TableInfo<$CatchRecordsTable, CatchRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatchRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fishingLogIdMeta = const VerificationMeta(
    'fishingLogId',
  );
  @override
  late final GeneratedColumn<String> fishingLogId = GeneratedColumn<String>(
    'fishing_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES fishing_logs (id)',
    ),
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeCmMeta = const VerificationMeta('sizeCm');
  @override
  late final GeneratedColumn<double> sizeCm = GeneratedColumn<double>(
    'size_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightGMeta = const VerificationMeta(
    'weightG',
  );
  @override
  late final GeneratedColumn<double> weightG = GeneratedColumn<double>(
    'weight_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _methodDetailMeta = const VerificationMeta(
    'methodDetail',
  );
  @override
  late final GeneratedColumn<String> methodDetail = GeneratedColumn<String>(
    'method_detail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tackleIdMeta = const VerificationMeta(
    'tackleId',
  );
  @override
  late final GeneratedColumn<String> tackleId = GeneratedColumn<String>(
    'tackle_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tackles (id)',
    ),
  );
  static const VerificationMeta _hitTimeMeta = const VerificationMeta(
    'hitTime',
  );
  @override
  late final GeneratedColumn<DateTime> hitTime = GeneratedColumn<DateTime>(
    'hit_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fishingLogId,
    species,
    sizeCm,
    weightG,
    method,
    methodDetail,
    tackleId,
    hitTime,
    photoPath,
    memo,
    updatedAt,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'catch_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatchRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fishing_log_id')) {
      context.handle(
        _fishingLogIdMeta,
        fishingLogId.isAcceptableOrUnknown(
          data['fishing_log_id']!,
          _fishingLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fishingLogIdMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('size_cm')) {
      context.handle(
        _sizeCmMeta,
        sizeCm.isAcceptableOrUnknown(data['size_cm']!, _sizeCmMeta),
      );
    }
    if (data.containsKey('weight_g')) {
      context.handle(
        _weightGMeta,
        weightG.isAcceptableOrUnknown(data['weight_g']!, _weightGMeta),
      );
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('method_detail')) {
      context.handle(
        _methodDetailMeta,
        methodDetail.isAcceptableOrUnknown(
          data['method_detail']!,
          _methodDetailMeta,
        ),
      );
    }
    if (data.containsKey('tackle_id')) {
      context.handle(
        _tackleIdMeta,
        tackleId.isAcceptableOrUnknown(data['tackle_id']!, _tackleIdMeta),
      );
    }
    if (data.containsKey('hit_time')) {
      context.handle(
        _hitTimeMeta,
        hitTime.isAcceptableOrUnknown(data['hit_time']!, _hitTimeMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatchRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatchRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fishingLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fishing_log_id'],
      )!,
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      )!,
      sizeCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}size_cm'],
      ),
      weightG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_g'],
      ),
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      ),
      methodDetail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method_detail'],
      ),
      tackleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tackle_id'],
      ),
      hitTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hit_time'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $CatchRecordsTable createAlias(String alias) {
    return $CatchRecordsTable(attachedDatabase, alias);
  }
}

class CatchRecord extends DataClass implements Insertable<CatchRecord> {
  final String id;
  final String fishingLogId;
  final String species;
  final double? sizeCm;
  final double? weightG;
  final String? method;
  final String? methodDetail;
  final String? tackleId;
  final DateTime? hitTime;
  final String? photoPath;
  final String? memo;
  final DateTime updatedAt;
  final bool isDeleted;
  const CatchRecord({
    required this.id,
    required this.fishingLogId,
    required this.species,
    this.sizeCm,
    this.weightG,
    this.method,
    this.methodDetail,
    this.tackleId,
    this.hitTime,
    this.photoPath,
    this.memo,
    required this.updatedAt,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['fishing_log_id'] = Variable<String>(fishingLogId);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || sizeCm != null) {
      map['size_cm'] = Variable<double>(sizeCm);
    }
    if (!nullToAbsent || weightG != null) {
      map['weight_g'] = Variable<double>(weightG);
    }
    if (!nullToAbsent || method != null) {
      map['method'] = Variable<String>(method);
    }
    if (!nullToAbsent || methodDetail != null) {
      map['method_detail'] = Variable<String>(methodDetail);
    }
    if (!nullToAbsent || tackleId != null) {
      map['tackle_id'] = Variable<String>(tackleId);
    }
    if (!nullToAbsent || hitTime != null) {
      map['hit_time'] = Variable<DateTime>(hitTime);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  CatchRecordsCompanion toCompanion(bool nullToAbsent) {
    return CatchRecordsCompanion(
      id: Value(id),
      fishingLogId: Value(fishingLogId),
      species: Value(species),
      sizeCm: sizeCm == null && nullToAbsent
          ? const Value.absent()
          : Value(sizeCm),
      weightG: weightG == null && nullToAbsent
          ? const Value.absent()
          : Value(weightG),
      method: method == null && nullToAbsent
          ? const Value.absent()
          : Value(method),
      methodDetail: methodDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(methodDetail),
      tackleId: tackleId == null && nullToAbsent
          ? const Value.absent()
          : Value(tackleId),
      hitTime: hitTime == null && nullToAbsent
          ? const Value.absent()
          : Value(hitTime),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory CatchRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatchRecord(
      id: serializer.fromJson<String>(json['id']),
      fishingLogId: serializer.fromJson<String>(json['fishingLogId']),
      species: serializer.fromJson<String>(json['species']),
      sizeCm: serializer.fromJson<double?>(json['sizeCm']),
      weightG: serializer.fromJson<double?>(json['weightG']),
      method: serializer.fromJson<String?>(json['method']),
      methodDetail: serializer.fromJson<String?>(json['methodDetail']),
      tackleId: serializer.fromJson<String?>(json['tackleId']),
      hitTime: serializer.fromJson<DateTime?>(json['hitTime']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      memo: serializer.fromJson<String?>(json['memo']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fishingLogId': serializer.toJson<String>(fishingLogId),
      'species': serializer.toJson<String>(species),
      'sizeCm': serializer.toJson<double?>(sizeCm),
      'weightG': serializer.toJson<double?>(weightG),
      'method': serializer.toJson<String?>(method),
      'methodDetail': serializer.toJson<String?>(methodDetail),
      'tackleId': serializer.toJson<String?>(tackleId),
      'hitTime': serializer.toJson<DateTime?>(hitTime),
      'photoPath': serializer.toJson<String?>(photoPath),
      'memo': serializer.toJson<String?>(memo),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  CatchRecord copyWith({
    String? id,
    String? fishingLogId,
    String? species,
    Value<double?> sizeCm = const Value.absent(),
    Value<double?> weightG = const Value.absent(),
    Value<String?> method = const Value.absent(),
    Value<String?> methodDetail = const Value.absent(),
    Value<String?> tackleId = const Value.absent(),
    Value<DateTime?> hitTime = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    Value<String?> memo = const Value.absent(),
    DateTime? updatedAt,
    bool? isDeleted,
  }) => CatchRecord(
    id: id ?? this.id,
    fishingLogId: fishingLogId ?? this.fishingLogId,
    species: species ?? this.species,
    sizeCm: sizeCm.present ? sizeCm.value : this.sizeCm,
    weightG: weightG.present ? weightG.value : this.weightG,
    method: method.present ? method.value : this.method,
    methodDetail: methodDetail.present ? methodDetail.value : this.methodDetail,
    tackleId: tackleId.present ? tackleId.value : this.tackleId,
    hitTime: hitTime.present ? hitTime.value : this.hitTime,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    memo: memo.present ? memo.value : this.memo,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  CatchRecord copyWithCompanion(CatchRecordsCompanion data) {
    return CatchRecord(
      id: data.id.present ? data.id.value : this.id,
      fishingLogId: data.fishingLogId.present
          ? data.fishingLogId.value
          : this.fishingLogId,
      species: data.species.present ? data.species.value : this.species,
      sizeCm: data.sizeCm.present ? data.sizeCm.value : this.sizeCm,
      weightG: data.weightG.present ? data.weightG.value : this.weightG,
      method: data.method.present ? data.method.value : this.method,
      methodDetail: data.methodDetail.present
          ? data.methodDetail.value
          : this.methodDetail,
      tackleId: data.tackleId.present ? data.tackleId.value : this.tackleId,
      hitTime: data.hitTime.present ? data.hitTime.value : this.hitTime,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      memo: data.memo.present ? data.memo.value : this.memo,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatchRecord(')
          ..write('id: $id, ')
          ..write('fishingLogId: $fishingLogId, ')
          ..write('species: $species, ')
          ..write('sizeCm: $sizeCm, ')
          ..write('weightG: $weightG, ')
          ..write('method: $method, ')
          ..write('methodDetail: $methodDetail, ')
          ..write('tackleId: $tackleId, ')
          ..write('hitTime: $hitTime, ')
          ..write('photoPath: $photoPath, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fishingLogId,
    species,
    sizeCm,
    weightG,
    method,
    methodDetail,
    tackleId,
    hitTime,
    photoPath,
    memo,
    updatedAt,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatchRecord &&
          other.id == this.id &&
          other.fishingLogId == this.fishingLogId &&
          other.species == this.species &&
          other.sizeCm == this.sizeCm &&
          other.weightG == this.weightG &&
          other.method == this.method &&
          other.methodDetail == this.methodDetail &&
          other.tackleId == this.tackleId &&
          other.hitTime == this.hitTime &&
          other.photoPath == this.photoPath &&
          other.memo == this.memo &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class CatchRecordsCompanion extends UpdateCompanion<CatchRecord> {
  final Value<String> id;
  final Value<String> fishingLogId;
  final Value<String> species;
  final Value<double?> sizeCm;
  final Value<double?> weightG;
  final Value<String?> method;
  final Value<String?> methodDetail;
  final Value<String?> tackleId;
  final Value<DateTime?> hitTime;
  final Value<String?> photoPath;
  final Value<String?> memo;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const CatchRecordsCompanion({
    this.id = const Value.absent(),
    this.fishingLogId = const Value.absent(),
    this.species = const Value.absent(),
    this.sizeCm = const Value.absent(),
    this.weightG = const Value.absent(),
    this.method = const Value.absent(),
    this.methodDetail = const Value.absent(),
    this.tackleId = const Value.absent(),
    this.hitTime = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.memo = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatchRecordsCompanion.insert({
    required String id,
    required String fishingLogId,
    required String species,
    this.sizeCm = const Value.absent(),
    this.weightG = const Value.absent(),
    this.method = const Value.absent(),
    this.methodDetail = const Value.absent(),
    this.tackleId = const Value.absent(),
    this.hitTime = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.memo = const Value.absent(),
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fishingLogId = Value(fishingLogId),
       species = Value(species),
       updatedAt = Value(updatedAt);
  static Insertable<CatchRecord> custom({
    Expression<String>? id,
    Expression<String>? fishingLogId,
    Expression<String>? species,
    Expression<double>? sizeCm,
    Expression<double>? weightG,
    Expression<String>? method,
    Expression<String>? methodDetail,
    Expression<String>? tackleId,
    Expression<DateTime>? hitTime,
    Expression<String>? photoPath,
    Expression<String>? memo,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fishingLogId != null) 'fishing_log_id': fishingLogId,
      if (species != null) 'species': species,
      if (sizeCm != null) 'size_cm': sizeCm,
      if (weightG != null) 'weight_g': weightG,
      if (method != null) 'method': method,
      if (methodDetail != null) 'method_detail': methodDetail,
      if (tackleId != null) 'tackle_id': tackleId,
      if (hitTime != null) 'hit_time': hitTime,
      if (photoPath != null) 'photo_path': photoPath,
      if (memo != null) 'memo': memo,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatchRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? fishingLogId,
    Value<String>? species,
    Value<double?>? sizeCm,
    Value<double?>? weightG,
    Value<String?>? method,
    Value<String?>? methodDetail,
    Value<String?>? tackleId,
    Value<DateTime?>? hitTime,
    Value<String?>? photoPath,
    Value<String?>? memo,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return CatchRecordsCompanion(
      id: id ?? this.id,
      fishingLogId: fishingLogId ?? this.fishingLogId,
      species: species ?? this.species,
      sizeCm: sizeCm ?? this.sizeCm,
      weightG: weightG ?? this.weightG,
      method: method ?? this.method,
      methodDetail: methodDetail ?? this.methodDetail,
      tackleId: tackleId ?? this.tackleId,
      hitTime: hitTime ?? this.hitTime,
      photoPath: photoPath ?? this.photoPath,
      memo: memo ?? this.memo,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fishingLogId.present) {
      map['fishing_log_id'] = Variable<String>(fishingLogId.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (sizeCm.present) {
      map['size_cm'] = Variable<double>(sizeCm.value);
    }
    if (weightG.present) {
      map['weight_g'] = Variable<double>(weightG.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (methodDetail.present) {
      map['method_detail'] = Variable<String>(methodDetail.value);
    }
    if (tackleId.present) {
      map['tackle_id'] = Variable<String>(tackleId.value);
    }
    if (hitTime.present) {
      map['hit_time'] = Variable<DateTime>(hitTime.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatchRecordsCompanion(')
          ..write('id: $id, ')
          ..write('fishingLogId: $fishingLogId, ')
          ..write('species: $species, ')
          ..write('sizeCm: $sizeCm, ')
          ..write('weightG: $weightG, ')
          ..write('method: $method, ')
          ..write('methodDetail: $methodDetail, ')
          ..write('tackleId: $tackleId, ')
          ..write('hitTime: $hitTime, ')
          ..write('photoPath: $photoPath, ')
          ..write('memo: $memo, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FishingLogsTable fishingLogs = $FishingLogsTable(this);
  late final $TacklesTable tackles = $TacklesTable(this);
  late final $CatchRecordsTable catchRecords = $CatchRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    fishingLogs,
    tackles,
    catchRecords,
  ];
}

typedef $$FishingLogsTableCreateCompanionBuilder =
    FishingLogsCompanion Function({
      required String id,
      required DateTime loggedAt,
      required String locationName,
      Value<String?> locationLabel,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> weather,
      Value<String?> tide,
      Value<double?> temperature,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$FishingLogsTableUpdateCompanionBuilder =
    FishingLogsCompanion Function({
      Value<String> id,
      Value<DateTime> loggedAt,
      Value<String> locationName,
      Value<String?> locationLabel,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> weather,
      Value<String?> tide,
      Value<double?> temperature,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$FishingLogsTableReferences
    extends BaseReferences<_$AppDatabase, $FishingLogsTable, FishingLog> {
  $$FishingLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatchRecordsTable, List<CatchRecord>>
  _catchRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.catchRecords,
    aliasName: 'fishing_logs__id__catch_records__fishing_log_id',
  );

  $$CatchRecordsTableProcessedTableManager get catchRecordsRefs {
    final manager = $$CatchRecordsTableTableManager(
      $_db,
      $_db.catchRecords,
    ).filter((f) => f.fishingLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FishingLogsTableFilterComposer
    extends Composer<_$AppDatabase, $FishingLogsTable> {
  $$FishingLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationLabel => $composableBuilder(
    column: $table.locationLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weather => $composableBuilder(
    column: $table.weather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tide => $composableBuilder(
    column: $table.tide,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catchRecordsRefs(
    Expression<bool> Function($$CatchRecordsTableFilterComposer f) f,
  ) {
    final $$CatchRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catchRecords,
      getReferencedColumn: (t) => t.fishingLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchRecordsTableFilterComposer(
            $db: $db,
            $table: $db.catchRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FishingLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $FishingLogsTable> {
  $$FishingLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationLabel => $composableBuilder(
    column: $table.locationLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weather => $composableBuilder(
    column: $table.weather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tide => $composableBuilder(
    column: $table.tide,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FishingLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FishingLogsTable> {
  $$FishingLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationLabel => $composableBuilder(
    column: $table.locationLabel,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get weather =>
      $composableBuilder(column: $table.weather, builder: (column) => column);

  GeneratedColumn<String> get tide =>
      $composableBuilder(column: $table.tide, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> catchRecordsRefs<T extends Object>(
    Expression<T> Function($$CatchRecordsTableAnnotationComposer a) f,
  ) {
    final $$CatchRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catchRecords,
      getReferencedColumn: (t) => t.fishingLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.catchRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FishingLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FishingLogsTable,
          FishingLog,
          $$FishingLogsTableFilterComposer,
          $$FishingLogsTableOrderingComposer,
          $$FishingLogsTableAnnotationComposer,
          $$FishingLogsTableCreateCompanionBuilder,
          $$FishingLogsTableUpdateCompanionBuilder,
          (FishingLog, $$FishingLogsTableReferences),
          FishingLog,
          PrefetchHooks Function({bool catchRecordsRefs})
        > {
  $$FishingLogsTableTableManager(_$AppDatabase db, $FishingLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FishingLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FishingLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FishingLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<String> locationName = const Value.absent(),
                Value<String?> locationLabel = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> weather = const Value.absent(),
                Value<String?> tide = const Value.absent(),
                Value<double?> temperature = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FishingLogsCompanion(
                id: id,
                loggedAt: loggedAt,
                locationName: locationName,
                locationLabel: locationLabel,
                latitude: latitude,
                longitude: longitude,
                weather: weather,
                tide: tide,
                temperature: temperature,
                memo: memo,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime loggedAt,
                required String locationName,
                Value<String?> locationLabel = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> weather = const Value.absent(),
                Value<String?> tide = const Value.absent(),
                Value<double?> temperature = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FishingLogsCompanion.insert(
                id: id,
                loggedAt: loggedAt,
                locationName: locationName,
                locationLabel: locationLabel,
                latitude: latitude,
                longitude: longitude,
                weather: weather,
                tide: tide,
                temperature: temperature,
                memo: memo,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FishingLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catchRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catchRecordsRefs) db.catchRecords],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catchRecordsRefs)
                    await $_getPrefetchedData<
                      FishingLog,
                      $FishingLogsTable,
                      CatchRecord
                    >(
                      currentTable: table,
                      referencedTable: $$FishingLogsTableReferences
                          ._catchRecordsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FishingLogsTableReferences(
                            db,
                            table,
                            p0,
                          ).catchRecordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.fishingLogId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FishingLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FishingLogsTable,
      FishingLog,
      $$FishingLogsTableFilterComposer,
      $$FishingLogsTableOrderingComposer,
      $$FishingLogsTableAnnotationComposer,
      $$FishingLogsTableCreateCompanionBuilder,
      $$FishingLogsTableUpdateCompanionBuilder,
      (FishingLog, $$FishingLogsTableReferences),
      FishingLog,
      PrefetchHooks Function({bool catchRecordsRefs})
    >;
typedef $$TacklesTableCreateCompanionBuilder =
    TacklesCompanion Function({
      required String id,
      required String category,
      required String name,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$TacklesTableUpdateCompanionBuilder =
    TacklesCompanion Function({
      Value<String> id,
      Value<String> category,
      Value<String> name,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$TacklesTableReferences
    extends BaseReferences<_$AppDatabase, $TacklesTable, Tackle> {
  $$TacklesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatchRecordsTable, List<CatchRecord>>
  _catchRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.catchRecords,
    aliasName: 'tackles__id__catch_records__tackle_id',
  );

  $$CatchRecordsTableProcessedTableManager get catchRecordsRefs {
    final manager = $$CatchRecordsTableTableManager(
      $_db,
      $_db.catchRecords,
    ).filter((f) => f.tackleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TacklesTableFilterComposer
    extends Composer<_$AppDatabase, $TacklesTable> {
  $$TacklesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catchRecordsRefs(
    Expression<bool> Function($$CatchRecordsTableFilterComposer f) f,
  ) {
    final $$CatchRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catchRecords,
      getReferencedColumn: (t) => t.tackleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchRecordsTableFilterComposer(
            $db: $db,
            $table: $db.catchRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TacklesTableOrderingComposer
    extends Composer<_$AppDatabase, $TacklesTable> {
  $$TacklesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TacklesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TacklesTable> {
  $$TacklesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> catchRecordsRefs<T extends Object>(
    Expression<T> Function($$CatchRecordsTableAnnotationComposer a) f,
  ) {
    final $$CatchRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catchRecords,
      getReferencedColumn: (t) => t.tackleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.catchRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TacklesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TacklesTable,
          Tackle,
          $$TacklesTableFilterComposer,
          $$TacklesTableOrderingComposer,
          $$TacklesTableAnnotationComposer,
          $$TacklesTableCreateCompanionBuilder,
          $$TacklesTableUpdateCompanionBuilder,
          (Tackle, $$TacklesTableReferences),
          Tackle,
          PrefetchHooks Function({bool catchRecordsRefs})
        > {
  $$TacklesTableTableManager(_$AppDatabase db, $TacklesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TacklesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TacklesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TacklesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TacklesCompanion(
                id: id,
                category: category,
                name: name,
                memo: memo,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String category,
                required String name,
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TacklesCompanion.insert(
                id: id,
                category: category,
                name: name,
                memo: memo,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TacklesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catchRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catchRecordsRefs) db.catchRecords],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catchRecordsRefs)
                    await $_getPrefetchedData<
                      Tackle,
                      $TacklesTable,
                      CatchRecord
                    >(
                      currentTable: table,
                      referencedTable: $$TacklesTableReferences
                          ._catchRecordsRefsTable(db),
                      managerFromTypedResult: (p0) => $$TacklesTableReferences(
                        db,
                        table,
                        p0,
                      ).catchRecordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tackleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TacklesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TacklesTable,
      Tackle,
      $$TacklesTableFilterComposer,
      $$TacklesTableOrderingComposer,
      $$TacklesTableAnnotationComposer,
      $$TacklesTableCreateCompanionBuilder,
      $$TacklesTableUpdateCompanionBuilder,
      (Tackle, $$TacklesTableReferences),
      Tackle,
      PrefetchHooks Function({bool catchRecordsRefs})
    >;
typedef $$CatchRecordsTableCreateCompanionBuilder =
    CatchRecordsCompanion Function({
      required String id,
      required String fishingLogId,
      required String species,
      Value<double?> sizeCm,
      Value<double?> weightG,
      Value<String?> method,
      Value<String?> methodDetail,
      Value<String?> tackleId,
      Value<DateTime?> hitTime,
      Value<String?> photoPath,
      Value<String?> memo,
      required DateTime updatedAt,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$CatchRecordsTableUpdateCompanionBuilder =
    CatchRecordsCompanion Function({
      Value<String> id,
      Value<String> fishingLogId,
      Value<String> species,
      Value<double?> sizeCm,
      Value<double?> weightG,
      Value<String?> method,
      Value<String?> methodDetail,
      Value<String?> tackleId,
      Value<DateTime?> hitTime,
      Value<String?> photoPath,
      Value<String?> memo,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

final class $$CatchRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $CatchRecordsTable, CatchRecord> {
  $$CatchRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FishingLogsTable _fishingLogIdTable(_$AppDatabase db) => db
      .fishingLogs
      .createAlias('catch_records__fishing_log_id__fishing_logs__id');

  $$FishingLogsTableProcessedTableManager get fishingLogId {
    final $_column = $_itemColumn<String>('fishing_log_id')!;

    final manager = $$FishingLogsTableTableManager(
      $_db,
      $_db.fishingLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fishingLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TacklesTable _tackleIdTable(_$AppDatabase db) =>
      db.tackles.createAlias('catch_records__tackle_id__tackles__id');

  $$TacklesTableProcessedTableManager? get tackleId {
    final $_column = $_itemColumn<String>('tackle_id');
    if ($_column == null) return null;
    final manager = $$TacklesTableTableManager(
      $_db,
      $_db.tackles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tackleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CatchRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $CatchRecordsTable> {
  $$CatchRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sizeCm => $composableBuilder(
    column: $table.sizeCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightG => $composableBuilder(
    column: $table.weightG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get methodDetail => $composableBuilder(
    column: $table.methodDetail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hitTime => $composableBuilder(
    column: $table.hitTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  $$FishingLogsTableFilterComposer get fishingLogId {
    final $$FishingLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fishingLogId,
      referencedTable: $db.fishingLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FishingLogsTableFilterComposer(
            $db: $db,
            $table: $db.fishingLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TacklesTableFilterComposer get tackleId {
    final $$TacklesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tackleId,
      referencedTable: $db.tackles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TacklesTableFilterComposer(
            $db: $db,
            $table: $db.tackles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $CatchRecordsTable> {
  $$CatchRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sizeCm => $composableBuilder(
    column: $table.sizeCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightG => $composableBuilder(
    column: $table.weightG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get methodDetail => $composableBuilder(
    column: $table.methodDetail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hitTime => $composableBuilder(
    column: $table.hitTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  $$FishingLogsTableOrderingComposer get fishingLogId {
    final $$FishingLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fishingLogId,
      referencedTable: $db.fishingLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FishingLogsTableOrderingComposer(
            $db: $db,
            $table: $db.fishingLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TacklesTableOrderingComposer get tackleId {
    final $$TacklesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tackleId,
      referencedTable: $db.tackles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TacklesTableOrderingComposer(
            $db: $db,
            $table: $db.tackles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatchRecordsTable> {
  $$CatchRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<double> get sizeCm =>
      $composableBuilder(column: $table.sizeCm, builder: (column) => column);

  GeneratedColumn<double> get weightG =>
      $composableBuilder(column: $table.weightG, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get methodDetail => $composableBuilder(
    column: $table.methodDetail,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hitTime =>
      $composableBuilder(column: $table.hitTime, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$FishingLogsTableAnnotationComposer get fishingLogId {
    final $$FishingLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fishingLogId,
      referencedTable: $db.fishingLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FishingLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.fishingLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TacklesTableAnnotationComposer get tackleId {
    final $$TacklesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tackleId,
      referencedTable: $db.tackles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TacklesTableAnnotationComposer(
            $db: $db,
            $table: $db.tackles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatchRecordsTable,
          CatchRecord,
          $$CatchRecordsTableFilterComposer,
          $$CatchRecordsTableOrderingComposer,
          $$CatchRecordsTableAnnotationComposer,
          $$CatchRecordsTableCreateCompanionBuilder,
          $$CatchRecordsTableUpdateCompanionBuilder,
          (CatchRecord, $$CatchRecordsTableReferences),
          CatchRecord,
          PrefetchHooks Function({bool fishingLogId, bool tackleId})
        > {
  $$CatchRecordsTableTableManager(_$AppDatabase db, $CatchRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatchRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatchRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatchRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fishingLogId = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<double?> sizeCm = const Value.absent(),
                Value<double?> weightG = const Value.absent(),
                Value<String?> method = const Value.absent(),
                Value<String?> methodDetail = const Value.absent(),
                Value<String?> tackleId = const Value.absent(),
                Value<DateTime?> hitTime = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatchRecordsCompanion(
                id: id,
                fishingLogId: fishingLogId,
                species: species,
                sizeCm: sizeCm,
                weightG: weightG,
                method: method,
                methodDetail: methodDetail,
                tackleId: tackleId,
                hitTime: hitTime,
                photoPath: photoPath,
                memo: memo,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fishingLogId,
                required String species,
                Value<double?> sizeCm = const Value.absent(),
                Value<double?> weightG = const Value.absent(),
                Value<String?> method = const Value.absent(),
                Value<String?> methodDetail = const Value.absent(),
                Value<String?> tackleId = const Value.absent(),
                Value<DateTime?> hitTime = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                required DateTime updatedAt,
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatchRecordsCompanion.insert(
                id: id,
                fishingLogId: fishingLogId,
                species: species,
                sizeCm: sizeCm,
                weightG: weightG,
                method: method,
                methodDetail: methodDetail,
                tackleId: tackleId,
                hitTime: hitTime,
                photoPath: photoPath,
                memo: memo,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CatchRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({fishingLogId = false, tackleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (fishingLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.fishingLogId,
                                referencedTable: $$CatchRecordsTableReferences
                                    ._fishingLogIdTable(db),
                                referencedColumn: $$CatchRecordsTableReferences
                                    ._fishingLogIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tackleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tackleId,
                                referencedTable: $$CatchRecordsTableReferences
                                    ._tackleIdTable(db),
                                referencedColumn: $$CatchRecordsTableReferences
                                    ._tackleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CatchRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatchRecordsTable,
      CatchRecord,
      $$CatchRecordsTableFilterComposer,
      $$CatchRecordsTableOrderingComposer,
      $$CatchRecordsTableAnnotationComposer,
      $$CatchRecordsTableCreateCompanionBuilder,
      $$CatchRecordsTableUpdateCompanionBuilder,
      (CatchRecord, $$CatchRecordsTableReferences),
      CatchRecord,
      PrefetchHooks Function({bool fishingLogId, bool tackleId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FishingLogsTableTableManager get fishingLogs =>
      $$FishingLogsTableTableManager(_db, _db.fishingLogs);
  $$TacklesTableTableManager get tackles =>
      $$TacklesTableTableManager(_db, _db.tackles);
  $$CatchRecordsTableTableManager get catchRecords =>
      $$CatchRecordsTableTableManager(_db, _db.catchRecords);
}

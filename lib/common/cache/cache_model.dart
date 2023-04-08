import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cache_model.g.dart';

@HiveType(typeId: 3)
class CacheModel extends Equatable {
  /// запрос
  @HiveField(0)
  final String url;

  /// время действия кеша
  @HiveField(1)
  final DateTime expired;

  /// модель данных для кеширования в виде строки JSON
  @HiveField(2)
  final String jsonData;

  const CacheModel({
    required this.url,
    required this.expired,
    required this.jsonData,
  });

  @override
  List<Object?> get props => [url, expired, jsonData];

  @override
  String toString() =>
      'CacheModel(url: $url, expired: $expired, jsonData: $jsonData)';
}

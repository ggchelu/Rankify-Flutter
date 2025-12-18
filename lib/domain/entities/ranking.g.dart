// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingImpl _$$RankingImplFromJson(Map<String, dynamic> json) =>
    _$RankingImpl(
      title: json['title'] as String,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => RankingItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      query: json['query'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$RankingImplToJson(_$RankingImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'items': instance.items,
      'query': instance.query,
      'createdAt': instance.createdAt.toIso8601String(),
    };

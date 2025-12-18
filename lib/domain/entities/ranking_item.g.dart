// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingItemImpl _$$RankingItemImplFromJson(Map<String, dynamic> json) =>
    _$RankingItemImpl(
      rank: (json['rank'] as num).toInt(),
      name: json['name'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String?,
      imageSearchTerm: json['imageSearchTerm'] as String,
    );

Map<String, dynamic> _$$RankingItemImplToJson(_$RankingItemImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
      'imageSearchTerm': instance.imageSearchTerm,
    };

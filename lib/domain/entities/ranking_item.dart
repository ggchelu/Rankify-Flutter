import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_item.freezed.dart';
part 'ranking_item.g.dart';

/// Ranking item entity
@freezed
class RankingItem with _$RankingItem {
  const factory RankingItem({
    required int rank,
    required String name,
    required String subtitle,
    required String description,
    @Default(0.0) double rating,
    String? imageUrl,
    required String imageSearchTerm,
  }) = _RankingItem;

  factory RankingItem.fromJson(Map<String, dynamic> json) =>
      _$RankingItemFromJson(json);
}


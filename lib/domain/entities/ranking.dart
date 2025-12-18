import 'package:freezed_annotation/freezed_annotation.dart';
import 'ranking_item.dart';

part 'ranking.freezed.dart';
part 'ranking.g.dart';

/// Ranking entity
@freezed
class Ranking with _$Ranking {
  const factory Ranking({
    required String title,
    required List<RankingItem> items,
    required String query,
    required DateTime createdAt,
  }) = _Ranking;

  factory Ranking.fromJson(Map<String, dynamic> json) => _$RankingFromJson(json);
}


import '../entities/ranking.dart';

/// Repository interface for ranking operations
abstract class RankingRepository {
  /// Generate a ranking from user query
  /// Returns (Ranking, isFromCache)
  Future<(Ranking, bool)> generateRanking(String query);

  /// Get search history
  Future<List<String>> getSearchHistory();

  /// Add query to search history
  Future<void> addToHistory(String query);

  /// Clear search history
  Future<void> clearHistory();
}


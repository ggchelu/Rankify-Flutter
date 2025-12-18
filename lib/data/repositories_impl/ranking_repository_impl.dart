import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/ranking.dart';
import '../../domain/repositories/ranking_repository.dart';
import '../datasources/remote/openai_api.dart';

/// Implementation of RankingRepository
class RankingRepositoryImpl implements RankingRepository {
  RankingRepositoryImpl({
    required OpenAiApi openAiApi,
    required SharedPreferences prefs,
  })  : _openAiApi = openAiApi,
        _prefs = prefs;

  final OpenAiApi _openAiApi;
  final SharedPreferences _prefs;

  static const String _historyKey = 'search_history';

  // In-memory cache for rankings
  static final Map<String, Ranking> _cache = {};

  @override
  Future<(Ranking, bool)> generateRanking(String query) async {
    final key = query.trim().toLowerCase();

    // Return cached result if available
    if (_cache.containsKey(key)) {
      return (_cache[key]!, true); // isFromCache = true
    }

    final ranking = await _openAiApi.generateRanking(query);
    _cache[key] = ranking;
    return (ranking, false); // isFromCache = false
  }

  @override
  Future<List<String>> getSearchHistory() async {
    return _prefs.getStringList(_historyKey) ?? [];
  }

  @override
  Future<void> addToHistory(String query) async {
    final history = await getSearchHistory();
    
    // Remove if exists and add to front
    history.remove(query);
    history.insert(0, query);
    
    // Keep only max items
    if (history.length > AppConstants.maxHistoryItems) {
      history.removeRange(
        AppConstants.maxHistoryItems,
        history.length,
      );
    }
    
    await _prefs.setStringList(_historyKey, history);
  }

  @override
  Future<void> clearHistory() async {
    await _prefs.remove(_historyKey);
  }
}


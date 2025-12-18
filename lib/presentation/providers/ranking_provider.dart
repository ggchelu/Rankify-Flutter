import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/remote/openai_api.dart';
import '../../data/repositories_impl/ranking_repository_impl.dart';
import '../../domain/entities/ranking.dart';
import '../../domain/repositories/ranking_repository.dart';

part 'ranking_provider.g.dart';

/// SharedPreferences provider
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) {
  return SharedPreferences.getInstance();
}

/// OpenAI API provider
@Riverpod(keepAlive: true)
OpenAiApi openAiApi(OpenAiApiRef ref) {
  return OpenAiApi();
}

/// Ranking repository provider
@Riverpod(keepAlive: true)
Future<RankingRepository> rankingRepository(RankingRepositoryRef ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final api = ref.watch(openAiApiProvider);
  return RankingRepositoryImpl(openAiApi: api, prefs: prefs);
}

/// Track if ranking is fresh (not from cache)
final isRankingFreshProvider = StateProvider<bool>((ref) => false);

/// Ranking state - simple StateNotifier approach
final rankingControllerProvider =
    StateNotifierProvider<RankingNotifier, AsyncValue<Ranking?>>((ref) {
  return RankingNotifier(ref);
});

class RankingNotifier extends StateNotifier<AsyncValue<Ranking?>> {
  RankingNotifier(this._ref) : super(const AsyncData(null));

  final Ref _ref;
  bool _isGenerating = false;

  void startGeneration(String query) {
    if (_isGenerating) {
      log('RankingNotifier: already generating, skipping');
      return;
    }
    _isGenerating = true;
    _ref.read(isRankingFreshProvider.notifier).state = false;
    log('RankingNotifier: starting generation for: $query');
    state = const AsyncLoading();
    _fetchRanking(query);
  }

  Future<void> _fetchRanking(String query) async {
    try {
      final repository = await _ref.read(rankingRepositoryProvider.future);
      log('RankingNotifier: calling API...');
      final (ranking, isFromCache) = await repository.generateRanking(query);
      log('RankingNotifier: got ${ranking.items.length} items, fromCache: $isFromCache');
      _ref.read(isRankingFreshProvider.notifier).state = !isFromCache;
      await repository.addToHistory(query);
      _ref.invalidate(searchHistoryProvider);
      state = AsyncData(ranking);
    } catch (e, st) {
      log('RankingNotifier: error: $e');
      state = AsyncError(e, st);
    } finally {
      _isGenerating = false;
    }
  }

  void clear() {
    state = const AsyncData(null);
    _isGenerating = false;
  }
}

/// Search history provider
@riverpod
Future<List<String>> searchHistory(SearchHistoryRef ref) async {
  final repository = await ref.watch(rankingRepositoryProvider.future);
  return repository.getSearchHistory();
}

/// Clear history action
@riverpod
class HistoryActions extends _$HistoryActions {
  @override
  FutureOr<void> build() => null;

  Future<void> clearHistory() async {
    final repository = await ref.read(rankingRepositoryProvider.future);
    await repository.clearHistory();
    ref.invalidate(searchHistoryProvider);
  }
}

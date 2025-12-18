// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'd0f94d4bd61259b4c06d24df95d1afc7eb5bd1c6';

/// SharedPreferences provider
///
/// Copied from [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = FutureProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPreferencesRef = FutureProviderRef<SharedPreferences>;
String _$openAiApiHash() => r'f6ad0a9f8b8438eeb543a0dc331f2f5ab26468a2';

/// OpenAI API provider
///
/// Copied from [openAiApi].
@ProviderFor(openAiApi)
final openAiApiProvider = Provider<OpenAiApi>.internal(
  openAiApi,
  name: r'openAiApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$openAiApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OpenAiApiRef = ProviderRef<OpenAiApi>;
String _$rankingRepositoryHash() => r'd07fd9245cd533853c0abb70e26398a15de09289';

/// Ranking repository provider
///
/// Copied from [rankingRepository].
@ProviderFor(rankingRepository)
final rankingRepositoryProvider = FutureProvider<RankingRepository>.internal(
  rankingRepository,
  name: r'rankingRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$rankingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RankingRepositoryRef = FutureProviderRef<RankingRepository>;
String _$searchHistoryHash() => r'6bd3a472cae034bddc13e063ef9d881d72c9dd6a';

/// Search history provider
///
/// Copied from [searchHistory].
@ProviderFor(searchHistory)
final searchHistoryProvider = AutoDisposeFutureProvider<List<String>>.internal(
  searchHistory,
  name: r'searchHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchHistoryRef = AutoDisposeFutureProviderRef<List<String>>;
String _$historyActionsHash() => r'725dba3f23fa9df286212232d22d2477a254e889';

/// Clear history action
///
/// Copied from [HistoryActions].
@ProviderFor(HistoryActions)
final historyActionsProvider =
    AutoDisposeAsyncNotifierProvider<HistoryActions, void>.internal(
      HistoryActions.new,
      name: r'historyActionsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$historyActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HistoryActions = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

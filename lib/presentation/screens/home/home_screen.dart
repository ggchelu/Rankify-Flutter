import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_locale.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../providers/ranking_provider.dart';
import 'widgets/suggestion_chips.dart';

/// Home screen with tabs for Search and History
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final queryController = useTextEditingController();
    final hasText = useState(false);
    final isSubmitting = useState(false);
    final locale = ref.watch(localeProvider);

    useEffect(() {
      void listener() => hasText.value = queryController.text.isNotEmpty;
      queryController.addListener(listener);
      return () => queryController.removeListener(listener);
    }, [queryController]);

    useEffect(() {
      if (!ApiConstants.isApiKeyConfigured) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showApiKeyAlert(context);
        });
      }
      return null;
    }, const []);

    void submitQuery(String query) {
      if (!ApiConstants.isApiKeyConfigured) {
        _showApiKeyAlert(context);
        return;
      }
      if (query.trim().isEmpty || isSubmitting.value) return;
      isSubmitting.value = true;
      ref
          .read(rankingControllerProvider.notifier)
          .startGeneration(query.trim());
      context.push('/ranking').then((_) => isSubmitting.value = false);
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: context.bgGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context, ref, locale),
              const SizedBox(height: 16),
              _buildTabBar(tabController, context),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _SearchTab(
                      queryController: queryController,
                      hasText: hasText.value,
                      onSubmit: submitQuery,
                      locale: locale,
                    ),
                    _HistoryTab(
                      onSearchSelected: (query) {
                        queryController.text = query;
                        tabController.animateTo(0);
                        submitQuery(query);
                      },
                    ),
                  ],
                ),
              ),
              const _FooterLogo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref, AppLocale locale) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.emoji_events_rounded,
              color: context.bgColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            AppConstants.appName,
            style: AppTypography.headlineMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
          const Spacer(),
          _IconButton(
            icon: locale.flag,
            isEmoji: true,
            onTap: () => _showLanguageDialog(context, ref),
          ),
          const SizedBox(width: 8),
          _IconButton(
            icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            onTap:
                () =>
                    ref.read(themeModeProvider.notifier).state =
                        isDark ? ThemeMode.light : ThemeMode.dark,
          ),
        ],
      ).animate().fadeIn(duration: 400.ms),
    );
  }

  Widget _buildTabBar(TabController controller, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: context.surfaceLightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.background,
        unselectedLabelColor: context.textSecondaryColor,
        labelStyle: AppTypography.labelLarge.copyWith(inherit: false),
        unselectedLabelStyle: AppTypography.labelLarge.copyWith(inherit: false),
        dividerColor: Colors.transparent,
        tabs: const [Tab(text: 'Search'), Tab(text: 'History')],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (ctx) => SimpleDialog(
            backgroundColor: context.surfaceColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Language',
              style: AppTypography.headlineSmall.copyWith(
                color: context.textPrimaryColor,
              ),
            ),
            children:
                AppLocale.values.map((locale) {
                  final isSelected = ref.read(localeProvider) == locale;
                  return SimpleDialogOption(
                    onPressed: () {
                      ref.read(localeProvider.notifier).state = locale;
                      Navigator.pop(ctx);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? AppColors.primary.withOpacity(0.15)
                                : null,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            locale.flag,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            locale.name,
                            style: AppTypography.bodyLarge.copyWith(
                              color: context.textPrimaryColor,
                            ),
                          ),
                          if (isSelected) ...[
                            const Spacer(),
                            const Icon(
                              Icons.check_rounded,
                              color: AppColors.primary,
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
    );
  }

  void _showApiKeyAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (ctx) => AlertDialog(
            backgroundColor: context.surfaceColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            icon: const Icon(
              Icons.key_rounded,
              color: AppColors.primary,
              size: 48,
            ),
            title: Text(
              'API Key Required',
              style: AppTypography.headlineSmall.copyWith(
                color: context.textPrimaryColor,
              ),
            ),
            content: Text(
              'Please add your OpenAI API key in:\n\nlib/core/constants/api_constants.dart',
              style: AppTypography.bodyMedium.copyWith(
                color: context.textSecondaryColor,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(
                  'OK',
                  style: TextStyle(color: AppColors.primary, inherit: false),
                ),
              ),
            ],
          ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.onTap, this.icon, this.isEmoji = false});
  final VoidCallback onTap;
  final dynamic icon;
  final bool isEmoji;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.surfaceLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            isEmoji
                ? Text(icon as String, style: const TextStyle(fontSize: 20))
                : Icon(
                  icon as IconData,
                  color: context.textSecondaryColor,
                  size: 22,
                ),
      ),
    );
  }
}

class _SearchTab extends StatelessWidget {
  const _SearchTab({
    required this.queryController,
    required this.hasText,
    required this.onSubmit,
    required this.locale,
  });

  final TextEditingController queryController;
  final bool hasText;
  final Function(String) onSubmit;
  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            L10n.t(locale, 'whatToRank'),
            style: AppTypography.displayMedium.copyWith(
              color: context.textPrimaryColor,
            ),
          ).animate().fadeIn(duration: 400.ms),
          const SizedBox(height: 8),
          Text(
            L10n.t(locale, 'tagline'),
            style: AppTypography.bodyLarge.copyWith(
              color: context.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              color: context.surfaceColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: context.surfaceHighlightColor),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AppTextField(
                  controller: queryController,
                  hintText: L10n.t(locale, 'placeholder'),
                  prefixIcon: Icons.search_rounded,
                  onSubmitted: onSubmit,
                  maxLines: 2,
                  textInputAction: TextInputAction.search,
                ),
                const SizedBox(height: 16),
                AppButton(
                  onPressed:
                      hasText ? () => onSubmit(queryController.text) : null,
                  label: L10n.t(locale, 'generate'),
                  icon: Icons.auto_awesome_rounded,
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
          const SizedBox(height: 24),
          Text(
            L10n.t(locale, 'tryAsking'),
            style: AppTypography.labelLarge.copyWith(
              color: context.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 12),
          SuggestionChips(
            onChipSelected: (query) {
              queryController.text = query;
              onSubmit(query);
            },
          ),
        ],
      ),
    );
  }
}

class _HistoryTab extends ConsumerWidget {
  const _HistoryTab({required this.onSearchSelected});
  final ValueChanged<String> onSearchSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(searchHistoryProvider);

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async => ref.invalidate(searchHistoryProvider),
      child: historyAsync.when(
        data: (history) {
          if (history.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history_rounded,
                    size: 64,
                    color: context.textMutedColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No search history',
                    style: AppTypography.bodyLarge.copyWith(
                      color: context.textMutedColor,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: history.length + 1,
            itemBuilder: (context, index) {
              if (index == history.length) {
                return TextButton(
                  onPressed:
                      () =>
                          ref
                              .read(historyActionsProvider.notifier)
                              .clearHistory(),
                  child: Text(
                    'Clear History',
                    style: TextStyle(color: AppColors.error, inherit: false),
                  ),
                );
              }
              final query = history[index];
              return ListTile(
                leading: Icon(
                  Icons.history_rounded,
                  color: context.textMutedColor,
                ),
                title: Text(
                  query,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.textPrimaryColor,
                  ),
                ),
                trailing: Icon(
                  Icons.north_west_rounded,
                  size: 16,
                  color: context.textMutedColor,
                ),
                onTap: () => onSearchSelected(query),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ).animate().fadeIn(delay: Duration(milliseconds: index * 50));
            },
          );
        },
        loading:
            () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
        error: (_, __) => const Center(child: Text('Error loading history')),
      ),
    );
  }
}

class _FooterLogo extends StatelessWidget {
  const _FooterLogo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Powered by LabHouse',
        style: AppTypography.bodySmall.copyWith(color: context.textMutedColor),
      ),
    );
  }
}

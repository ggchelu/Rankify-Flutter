import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/app_locale.dart';
import '../../../core/errors/failure.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/loading_shimmer.dart';
import '../../../domain/entities/ranking.dart';
import '../../providers/ranking_provider.dart';
import '../../widgets/error_state.dart';
import 'widgets/ranking_header.dart';
import 'widgets/ranking_item_card.dart';

/// Ranking result screen with confetti and share
class RankingResultScreen extends HookConsumerWidget {
  const RankingResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingState = ref.watch(rankingControllerProvider);
    final locale = ref.watch(localeProvider);
    final confettiController = useMemoized(() => ConfettiController(duration: const Duration(seconds: 2)));
    final hasPlayedConfetti = useState(false);

    useEffect(() => confettiController.dispose, [confettiController]);

    // Play confetti only when a NEW ranking is generated (not from cache)
    ref.listen(rankingControllerProvider, (prev, next) {
      if (prev?.isLoading == true && next.hasValue && next.value != null && !hasPlayedConfetti.value) {
        final isFresh = ref.read(isRankingFreshProvider);
        if (isFresh) {
          hasPlayedConfetti.value = true;
          confettiController.play();
        }
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: context.bgGradient),
            child: SafeArea(
              child: Column(
                children: [
                  _buildAppBar(context, ref, locale, rankingState.valueOrNull),
                  Expanded(
                    child: rankingState.when(
                      data: (ranking) {
                        if (ranking == null) {
                          return Center(child: Text(L10n.t(locale, 'noRanking'), style: TextStyle(color: context.textMutedColor)));
                        }
                        return _buildRankingList(ranking);
                      },
                      loading: () => const RankingLoadingSkeleton(),
                      error: (error, _) => ErrorState(
                        message: error is Failure ? error.displayMessage : 'An unexpected error occurred',
                        onRetry: () => context.pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Confetti overlay
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [AppColors.primary, AppColors.gold, AppColors.accent, AppColors.success],
              numberOfParticles: 30,
              gravity: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, WidgetRef ref, AppLocale locale, Ranking? ranking) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              ref.read(rankingControllerProvider.notifier).clear();
              context.pop();
            },
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: context.surfaceLightColor, borderRadius: BorderRadius.circular(12)),
              child: Icon(Icons.arrow_back_rounded, color: context.textPrimaryColor, size: 20),
            ),
          ),
          const Spacer(),
          Text(L10n.t(locale, 'results'), style: AppTypography.headlineSmall.copyWith(color: context.textPrimaryColor)),
          const Spacer(),
          if (ranking != null)
            IconButton(
              onPressed: () => _shareRanking(ranking),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: context.surfaceLightColor, borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.share_rounded, color: context.textPrimaryColor, size: 20),
              ),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  void _shareRanking(Ranking ranking) {
    final buffer = StringBuffer();
    buffer.writeln('${ranking.title}\n');
    for (final item in ranking.items) {
      buffer.writeln('${item.rank}. ${item.name}');
      buffer.writeln('   ${item.subtitle}');
      if (item.rating > 0) buffer.writeln('   Rating: ${'⭐' * item.rating.round()}');
      buffer.writeln('   ${item.description}\n');
    }
    buffer.writeln('Generated with Rankify');
    Share.share(buffer.toString(), subject: ranking.title);
  }

  Widget _buildRankingList(Ranking ranking) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: RankingHeader(ranking: ranking)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => RankingItemCard(item: ranking.items[index], index: index),
              childCount: ranking.items.length,
            ),
          ),
        ),
      ],
    );
  }
}

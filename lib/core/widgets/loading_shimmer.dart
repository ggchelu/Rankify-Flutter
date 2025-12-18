import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/app_locale.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Shimmer loading widget
class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.surfaceLightColor,
      highlightColor: context.surfaceHighlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.surfaceLightColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Ranking skeleton loading with AI message
class RankingLoadingSkeleton extends ConsumerWidget {
  const RankingLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return Column(
      children: [
        const SizedBox(height: 60),
        _buildAIMessage(context, locale),
        const SizedBox(height: 40),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder:
                (ctx, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _RankingItemSkeleton(index: index),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIMessage(BuildContext context, AppLocale locale) {
    return Column(
      children: [
        Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.auto_awesome_rounded,
                color: context.bgColor,
                size: 32,
              ),
            )
            .animate(onPlay: (c) => c.repeat())
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.1, 1.1),
              duration: 1000.ms,
            )
            .then()
            .scale(
              begin: const Offset(1.1, 1.1),
              end: const Offset(1, 1),
              duration: 1000.ms,
            ),
        const SizedBox(height: 24),
        Text(
          L10n.t(locale, 'generating'),
          style: AppTypography.headlineSmall.copyWith(
            color: context.textPrimaryColor,
          ),
        ).animate().fadeIn(duration: 400.ms),
        const SizedBox(height: 8),
        Text(
          L10n.t(locale, 'wait'),
          style: AppTypography.bodyMedium.copyWith(
            color: context.textMutedColor,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) => _buildDot(i)),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        )
        .animate(onPlay: (c) => c.repeat())
        .fadeIn(delay: Duration(milliseconds: index * 200))
        .then()
        .fadeOut(delay: 400.ms);
  }
}

class _RankingItemSkeleton extends StatelessWidget {
  const _RankingItemSkeleton({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.surfaceLightColor,
      highlightColor: context.surfaceHighlightColor,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: context.surfaceLightColor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ).animate().fadeIn(
      delay: Duration(milliseconds: 400 + (index * 100)),
      duration: 400.ms,
    );
  }
}

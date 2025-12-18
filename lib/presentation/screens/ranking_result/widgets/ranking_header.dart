import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../domain/entities/ranking.dart';

/// Header for ranking results
class RankingHeader extends StatelessWidget {
  const RankingHeader({super.key, required this.ranking});

  final Ranking ranking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.auto_awesome_rounded, size: 14, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(
                  'AI Generated',
                  style: AppTypography.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.2, end: 0, curve: Curves.easeOut),
          const SizedBox(height: 12),
          Text(ranking.title, style: AppTypography.displaySmall.copyWith(color: context.textPrimaryColor))
              .animate().fadeIn(delay: 100.ms, duration: 400.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.format_list_numbered_rounded, size: 16, color: context.textMutedColor),
              const SizedBox(width: 6),
              Text('${ranking.items.length} items', style: AppTypography.bodySmall.copyWith(color: context.textSecondaryColor)),
              const SizedBox(width: 16),
              Icon(Icons.schedule_rounded, size: 16, color: context.textMutedColor),
              const SizedBox(width: 6),
              Text(_formatDate(ranking.createdAt), style: AppTypography.bodySmall.copyWith(color: context.textSecondaryColor)),
            ],
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

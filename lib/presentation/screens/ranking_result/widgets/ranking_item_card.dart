import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/star_rating.dart';
import '../../../../domain/entities/ranking_item.dart';

/// Card for displaying a ranking item
class RankingItemCard extends StatelessWidget {
  const RankingItemCard({super.key, required this.item, required this.index});

  final RankingItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isTopThree = item.rank <= 3;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: context.cardGradient,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isTopThree ? AppColors.getRankColor(item.rank).withOpacity(0.3) : context.surfaceHighlightColor,
          width: isTopThree ? 1.5 : 1,
        ),
        boxShadow: isTopThree
            ? [BoxShadow(color: AppColors.getRankColor(item.rank).withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 8))]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showDetailSheet(context),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRankBadge(context),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: AppTypography.headlineSmall.copyWith(color: context.textPrimaryColor), maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text(item.subtitle, style: AppTypography.bodySmall.copyWith(color: context.textMutedColor)),
                      if (item.rating > 0) ...[const SizedBox(height: 8), StarRating(rating: item.rating)],
                      const SizedBox(height: 8),
                      Text(item.description, style: AppTypography.bodyMedium.copyWith(color: context.textSecondaryColor), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                _buildImage(context),
              ],
            ),
          ),
        ),
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: 100 + (index * 80)), duration: 400.ms)
        .slideY(begin: 0.2, end: 0, delay: Duration(milliseconds: 100 + (index * 80)), duration: 400.ms, curve: Curves.easeOutCubic);
  }

  Widget _buildRankBadge(BuildContext context) {
    final color = AppColors.getRankColor(item.rank);
    final isTopThree = item.rank <= 3;

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        gradient: isTopThree ? LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [color, color.withOpacity(0.7)]) : null,
        color: isTopThree ? null : context.surfaceHighlightColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isTopThree ? [BoxShadow(color: color.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))] : null,
      ),
      child: Center(
        child: Text(
          '${item.rank}',
          style: AppTypography.headlineMedium.copyWith(color: isTopThree ? AppColors.background : context.textSecondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final seed = item.imageSearchTerm.hashCode.abs() % 1000;
    final imageUrl = 'https://picsum.photos/seed/$seed/200/200';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        placeholder: (_, __) => Container(
          width: 80, height: 80,
          color: context.surfaceHighlightColor,
          child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(context.textMutedColor)))),
        ),
        errorWidget: (_, __, ___) => Container(
          width: 80, height: 80,
          color: context.surfaceHighlightColor,
          child: Icon(_getCategoryIcon(), color: context.textMutedColor, size: 32),
        ),
      ),
    );
  }

  IconData _getCategoryIcon() {
    final term = item.imageSearchTerm.toLowerCase();
    if (term.contains('book')) return Icons.menu_book_rounded;
    if (term.contains('movie') || term.contains('film')) return Icons.movie_rounded;
    if (term.contains('music') || term.contains('album')) return Icons.album_rounded;
    if (term.contains('food') || term.contains('restaurant')) return Icons.restaurant_rounded;
    if (term.contains('city') || term.contains('place')) return Icons.place_rounded;
    return Icons.image_rounded;
  }

  void _showDetailSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _DetailSheet(item: item),
    );
  }
}

class _DetailSheet extends StatelessWidget {
  const _DetailSheet({required this.item});
  final RankingItem item;

  @override
  Widget build(BuildContext context) {
    final seed = item.imageSearchTerm.hashCode.abs() % 1000;
    final imageUrl = 'https://picsum.photos/seed/$seed/400/400';

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
      decoration: BoxDecoration(color: context.surfaceColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: context.surfaceHighlightColor, borderRadius: BorderRadius.circular(2))),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.getRankColor(item.rank).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                        child: Text('#${item.rank}', style: AppTypography.labelLarge.copyWith(color: AppColors.getRankColor(item.rank))),
                      ),
                      const Spacer(),
                      if (item.rating > 0) StarRating(rating: item.rating),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(item.name, style: AppTypography.displaySmall.copyWith(color: context.textPrimaryColor)),
                  const SizedBox(height: 4),
                  Text(item.subtitle, style: AppTypography.bodyMedium.copyWith(color: context.textMutedColor)),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(height: 200, color: context.surfaceHighlightColor, child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(context.textMutedColor)))),
                      errorWidget: (_, __, ___) => Container(height: 200, color: context.surfaceHighlightColor, child: Icon(Icons.image_rounded, color: context.textMutedColor, size: 48)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('About', style: AppTypography.labelLarge.copyWith(color: context.textPrimaryColor)),
                  const SizedBox(height: 8),
                  Text(item.description, style: AppTypography.bodyLarge.copyWith(color: context.textSecondaryColor, height: 1.6)),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().slideY(begin: 0.2, end: 0, duration: 300.ms, curve: Curves.easeOut);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Suggestion chips for quick queries
class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key, required this.onChipSelected});

  final ValueChanged<String> onChipSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: AppConstants.suggestedQueries
          .take(6)
          .toList()
          .asMap()
          .entries
          .map((entry) => _SuggestionChip(
                label: entry.value,
                onTap: () => onChipSelected(entry.value),
                index: entry.key,
              ))
          .toList(),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({
    required this.label,
    required this.onTap,
    required this.index,
  });

  final String label;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final shortLabel = _extractShortLabel(label);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: context.surfaceLightColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.surfaceHighlightColor),
          ),
          child: Text(
            shortLabel,
            style: AppTypography.labelMedium.copyWith(color: context.textSecondaryColor),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 600 + (index * 50)), duration: 400.ms)
        .scale(
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
          delay: Duration(milliseconds: 600 + (index * 50)),
          duration: 400.ms,
          curve: Curves.easeOutBack,
        );
  }

  String _extractShortLabel(String label) {
    if (label.contains('books')) return '📚 Books';
    if (label.contains('cities') || label.contains('visit')) return '🌍 Travel';
    if (label.contains('movies')) return '🎬 Movies';
    if (label.contains('programming')) return '💻 Coding';
    if (label.contains('restaurants')) return '🍽️ Food';
    if (label.contains('apps')) return '📱 Apps';
    if (label.contains('albums')) return '🎵 Music';
    if (label.contains('beaches')) return '🏖️ Beaches';
    return label.substring(0, label.length.clamp(0, 20));
  }
}

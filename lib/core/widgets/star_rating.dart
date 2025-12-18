import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Star rating widget
class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    this.size = 16,
    this.color = AppColors.primary,
  });

  final double rating;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        IconData icon;
        
        if (rating >= starValue) {
          icon = Icons.star_rounded;
        } else if (rating >= starValue - 0.5) {
          icon = Icons.star_half_rounded;
        } else {
          icon = Icons.star_outline_rounded;
        }
        
        return Icon(
          icon,
          size: size,
          color: rating >= starValue - 0.5 ? color : AppColors.textMuted,
        );
      }),
    );
  }
}


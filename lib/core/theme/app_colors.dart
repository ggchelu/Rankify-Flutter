import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Theme mode provider
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

/// App color palette
class AppColors {
  AppColors._();

  // Primary palette (same for both themes)
  static const Color primary = Color(0xFFD4AF37); // Gold
  static const Color primaryLight = Color(0xFFE5C76B);
  static const Color primaryDark = Color(0xFFB8960C);

  // Accent colors (same for both themes)
  static const Color accent = Color(0xFF6366F1);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Rank colors
  static const Color gold = Color(0xFFFFD700);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color bronze = Color(0xFFCD7F32);

  static Color getRankColor(int rank) {
    switch (rank) {
      case 1: return gold;
      case 2: return silver;
      case 3: return bronze;
      default: return textSecondary;
    }
  }

  // ============ DARK THEME ============
  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF14141F);
  static const Color surfaceLight = Color(0xFF1E1E2E);
  static const Color surfaceHighlight = Color(0xFF2A2A3E);
  static const Color textPrimary = Color(0xFFF5F5F7);
  static const Color textSecondary = Color(0xFFA0A0B0);
  static const Color textMuted = Color(0xFF6B6B7B);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF14141F), Color(0xFF0A0A0F)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [surfaceLight, surface],
  );

  // ============ LIGHT THEME ============
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLightTheme = Color(0xFFFFFFFF);
  static const Color surfaceLightLight = Color(0xFFF0F0F5);
  static const Color surfaceHighlightLight = Color(0xFFE5E5EA);
  static const Color textPrimaryLight = Color(0xFF1A1A1F);
  static const Color textSecondaryLight = Color(0xFF6B6B7B);
  static const Color textMutedLight = Color(0xFFA0A0B0);

  static const LinearGradient backgroundGradientLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA)],
  );

  static const LinearGradient cardGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA)],
  );
}

/// Extension to get theme-aware colors
extension ThemeColors on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  
  Color get bgColor => isDark ? AppColors.background : AppColors.backgroundLight;
  Color get surfaceColor => isDark ? AppColors.surface : AppColors.surfaceLightTheme;
  Color get surfaceLightColor => isDark ? AppColors.surfaceLight : AppColors.surfaceLightLight;
  Color get surfaceHighlightColor => isDark ? AppColors.surfaceHighlight : AppColors.surfaceHighlightLight;
  Color get textPrimaryColor => isDark ? AppColors.textPrimary : AppColors.textPrimaryLight;
  Color get textSecondaryColor => isDark ? AppColors.textSecondary : AppColors.textSecondaryLight;
  Color get textMutedColor => isDark ? AppColors.textMuted : AppColors.textMutedLight;
  
  LinearGradient get bgGradient => isDark ? AppColors.backgroundGradient : AppColors.backgroundGradientLight;
  LinearGradient get cardGradient => isDark ? AppColors.cardGradient : AppColors.cardGradientLight;
}

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Semantic theme extension for colors not covered by standard ColorScheme.
class PehrawanThemeExtension extends ThemeExtension<PehrawanThemeExtension> {
  const PehrawanThemeExtension({
    required this.blush,
    required this.gold,
    required this.goldText,
    required this.success,
    required this.successLight,
    required this.warning,
    required this.warningLight,
    required this.surfaceGrey,
    required this.border,
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  final Color blush;
  final Color gold;
  final Color goldText;
  final Color success;
  final Color successLight;
  final Color warning;
  final Color warningLight;
  final Color surfaceGrey;
  final Color border;
  final Color shimmerBase;
  final Color shimmerHighlight;

  static const light = PehrawanThemeExtension(
    blush: AppColors.blush,
    gold: AppColors.gold,
    goldText: AppColors.goldText,
    success: AppColors.success,
    successLight: AppColors.successLight,
    warning: AppColors.warning,
    warningLight: AppColors.warningLight,
    surfaceGrey: AppColors.surfaceGrey,
    border: AppColors.borderLight,
    shimmerBase: AppColors.shimmerBaseLight,
    shimmerHighlight: AppColors.shimmerHighlightLight,
  );

  static const dark = PehrawanThemeExtension(
    blush: Color(0xFF3A1217),
    gold: AppColors.gold,
    goldText: AppColors.goldText,
    success: Color(0xFF4ADE80),
    successLight: Color(0xFF14532D),
    warning: Color(0xFFFBBF24),
    warningLight: Color(0xFF78350F),
    surfaceGrey: AppColors.darkSurfaceVariant,
    border: AppColors.darkBorder,
    shimmerBase: AppColors.shimmerBaseDark,
    shimmerHighlight: AppColors.shimmerHighlightDark,
  );

  @override
  PehrawanThemeExtension copyWith({
    Color? blush,
    Color? gold,
    Color? goldText,
    Color? success,
    Color? successLight,
    Color? warning,
    Color? warningLight,
    Color? surfaceGrey,
    Color? border,
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) {
    return PehrawanThemeExtension(
      blush: blush ?? this.blush,
      gold: gold ?? this.gold,
      goldText: goldText ?? this.goldText,
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      warning: warning ?? this.warning,
      warningLight: warningLight ?? this.warningLight,
      surfaceGrey: surfaceGrey ?? this.surfaceGrey,
      border: border ?? this.border,
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
    );
  }

  @override
  PehrawanThemeExtension lerp(
    covariant ThemeExtension<PehrawanThemeExtension>? other,
    double t,
  ) {
    if (other is! PehrawanThemeExtension) return this;
    return PehrawanThemeExtension(
      blush: Color.lerp(blush, other.blush, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      goldText: Color.lerp(goldText, other.goldText, t)!,
      success: Color.lerp(success, other.success, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
      surfaceGrey: Color.lerp(surfaceGrey, other.surfaceGrey, t)!,
      border: Color.lerp(border, other.border, t)!,
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t)!,
      shimmerHighlight: Color.lerp(
        shimmerHighlight,
        other.shimmerHighlight,
        t,
      )!,
    );
  }
}

extension PehrawanThemeContext on BuildContext {
  PehrawanThemeExtension get ext =>
      Theme.of(this).extension<PehrawanThemeExtension>() ??
      PehrawanThemeExtension.light;
}

abstract final class AppTheme {
  static ThemeData light({Locale? locale}) {
    final fontFamily = AppTypography.fontFamilyForLocale(locale);
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryRed,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.blush,
      onPrimaryContainer: AppColors.darkRed,
      secondary: AppColors.darkRed,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.surfaceGrey,
      onSecondaryContainer: AppColors.charcoalText,
      tertiary: AppColors.gold,
      onTertiary: AppColors.goldText,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.errorLight,
      onErrorContainer: AppColors.error,
      surface: AppColors.white,
      onSurface: AppColors.charcoalText,
      surfaceContainerHighest: AppColors.surfaceGrey,
      onSurfaceVariant: AppColors.secondaryText,
      outline: AppColors.borderLight,
      outlineVariant: AppColors.surfaceGrey,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      textColor: AppColors.charcoalText,
      secondaryColor: AppColors.secondaryText,
      extension: PehrawanThemeExtension.light,
    );
  }

  static ThemeData dark({Locale? locale}) {
    final fontFamily = AppTypography.fontFamilyForLocale(locale);
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryRed,
      onPrimary: AppColors.white,
      primaryContainer: Color(0xFF4A1016),
      onPrimaryContainer: AppColors.blush,
      secondary: AppColors.darkRed,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.darkSurfaceVariant,
      onSecondaryContainer: AppColors.darkText,
      tertiary: AppColors.gold,
      onTertiary: AppColors.goldText,
      error: Color(0xFFF87171),
      onError: AppColors.darkBackground,
      errorContainer: Color(0xFF7F1D1D),
      onErrorContainer: AppColors.errorLight,
      surface: AppColors.darkBackground,
      onSurface: AppColors.darkText,
      surfaceContainerHighest: AppColors.darkSurface,
      onSurfaceVariant: AppColors.darkSecondaryText,
      outline: AppColors.darkBorder,
      outlineVariant: AppColors.darkSurfaceVariant,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      textColor: AppColors.darkText,
      secondaryColor: AppColors.darkSecondaryText,
      extension: PehrawanThemeExtension.dark,
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required String fontFamily,
    required Color textColor,
    required Color secondaryColor,
    required PehrawanThemeExtension extension,
  }) {
    final textTheme = AppTypography.buildTextTheme(
      textColor: textColor,
      secondaryColor: secondaryColor,
      fontFamily: fontFamily,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      extensions: [extension],
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: AppSpacing.elevationNone,
        scrolledUnderElevation: AppSpacing.elevationNone,
        centerTitle: false,
        titleTextStyle: textTheme.headlineSmall,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: AppSpacing.elevationNone,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          side: BorderSide(color: extension.border, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: extension.surfaceGrey,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          borderSide: BorderSide(color: extension.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: AppSpacing.elevationMd,
      ),
      dividerTheme: DividerThemeData(
        color: extension.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

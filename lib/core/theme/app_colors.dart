import 'package:flutter/material.dart';

/// Design system color tokens for Pehrawan.
/// Zero hardcoded colors should appear in feature or shared widgets.
abstract final class AppColors {
  // Brand & Primary
  static const Color primaryRed = Color(0xFFE11D2E);
  static const Color darkRed = Color(0xFFB3121F);
  static const Color blush = Color(0xFFFFF1F2);

  // Neutrals (Light)
  static const Color white = Color(0xFFFFFFFF);
  static const Color surfaceGrey = Color(0xFFF5F5F7);
  static const Color charcoalText = Color(0xFF1A1A1A);
  static const Color secondaryText = Color(0xFF5C5C66);
  static const Color borderLight = Color(0xFFE5E5EA);
  static const Color disabledBg = Color(0xFFEAEAEF);
  static const Color disabledText = Color(0xFF8E8E93);

  // Neutrals (Dark)
  static const Color darkBackground = Color(0xFF121214);
  static const Color darkSurface = Color(0xFF1C1C1F);
  static const Color darkSurfaceVariant = Color(0xFF28282D);
  static const Color darkText = Color(0xFFF5F5F7);
  static const Color darkSecondaryText = Color(0xFFA1A1AA);
  static const Color darkBorder = Color(0xFF323238);

  // Accent (ONLY for discount badges and rating stars)
  static const Color gold = Color(0xFFF5B301);
  static const Color goldText = Color(0xFF1A1A1A);

  // Semantic
  static const Color success = Color(0xFF15803D);
  static const Color successLight = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFB91C1C);
  static const Color errorLight = Color(0xFFFEE2E2);

  // Shimmer
  static const Color shimmerBaseLight = Color(0xFFE5E5EA);
  static const Color shimmerHighlightLight = Color(0xFFF5F5F7);
  static const Color shimmerBaseDark = Color(0xFF28282D);
  static const Color shimmerHighlightDark = Color(0xFF3A3A40);
}

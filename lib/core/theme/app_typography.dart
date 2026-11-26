import 'package:flutter/material.dart';

/// Typography definitions using Poppins (EN) and NotoNastaliqUrdu (UR).
abstract final class AppTypography {
  static const String fontFamilyEn = 'Poppins';
  static const String fontFamilyUr = 'NotoNastaliqUrdu';

  static String fontFamilyForLocale(Locale? locale) {
    if (locale?.languageCode == 'ur') {
      return fontFamilyUr;
    }
    return fontFamilyEn;
  }

  static TextTheme buildTextTheme({
    required Color textColor,
    required Color secondaryColor,
    required String fontFamily,
  }) {
    final isUrdu = fontFamily == fontFamilyUr;
    // Nastaliq script needs slightly more line height to prevent clipping.
    final heightMultiplier = isUrdu ? 1.55 : 1.3;

    return TextTheme(
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: heightMultiplier,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: heightMultiplier,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: heightMultiplier,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: heightMultiplier,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: heightMultiplier,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: heightMultiplier,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: heightMultiplier,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: heightMultiplier,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: heightMultiplier,
        color: secondaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: heightMultiplier,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: heightMultiplier,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: heightMultiplier,
        color: secondaryColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primaryDark,
      surface: AppColors.surface,
      background: AppColors.background,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimary,
      onBackground: AppColors.textPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
    ),
    textTheme: const TextTheme(
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      bodyMedium: AppTextStyle.body,
      bodySmall: AppTextStyle.caption,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.pillRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
        textStyle: AppTextStyle.button,
      ),
    ),
  );

  static ThemeData dark = light.copyWith(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: light.colorScheme.copyWith(
      background: Colors.black,
      surface: const Color(0xFF1C1C1E),
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: light.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
  );
}


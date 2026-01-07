import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFD98C7B); // 橙棕色
  static const Color primaryDark = Color(0xFFC57665);
  static const Color background = Color(0xFFF7F7F7); // 浅米色
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textTertiary = Color(0xFF999999);
  static const Color border = Color(0xFFE5E5E5);
  static const Color tagBackground = Color(0xFFF5F5F5);
  static const Color indicatorInactive = Color(0xFFD8D8D8);
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 6;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double cardRadius = 14;
  static const double pillRadius = 18;
}

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle titleLarge =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary);
  static const TextStyle titleMedium =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary);
  static const TextStyle body =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textSecondary, height: 1.4);
  static const TextStyle caption =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textTertiary);
  static const TextStyle button =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
}


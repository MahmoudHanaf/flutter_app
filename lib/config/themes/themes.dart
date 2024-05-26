import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.light(secondary: AppColors.primary),
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: AppColors.grey,
        elevation: 0,
      ),
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: TextStyle(color: AppColors.blackColor, fontSize: 28),
        headlineLarge: TextStyle(color: AppColors.blackColor, fontSize: 24),
        headlineMedium: TextStyle(color: AppColors.blackColor, fontSize: 20),
        headlineSmall: TextStyle(color: AppColors.blackColor, fontSize: 18),
        titleLarge: TextStyle(color: AppColors.blackColor, fontSize: 18),
        titleMedium: TextStyle(color: AppColors.blackColor, fontSize: 16),
        titleSmall: TextStyle(color: AppColors.blackColor, fontSize: 14),
        bodyLarge: TextStyle(color: AppColors.blackColor, fontSize: 15),
        bodyMedium: TextStyle(color: AppColors.blackColor, fontSize: 14),
        bodySmall: TextStyle(color: AppColors.blackColor, fontSize: 12),
        labelLarge: TextStyle(color: AppColors.blackColor, fontSize: 20),
        labelMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16,
        ),
        labelSmall: TextStyle(color: AppColors.blackColor, fontSize: 10),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.blackColor, fontSize: 12),
        labelStyle: TextStyle(color: AppColors.blackColor, fontSize: 14),
        fillColor: AppColors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}

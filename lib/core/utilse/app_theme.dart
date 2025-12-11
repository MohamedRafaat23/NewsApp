import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utilse/app_style.dart';
import 'app_colors.dart';

abstract class AppTheme {

  // ================== LIGHT THEME ==================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,

    splashColor: AppColors.black.withOpacity(0.05),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      actionsIconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),

   textTheme: TextTheme(
  headlineLarge: AppStyles.medium24Black.copyWith(color: AppColors.black),
  headlineMedium: AppStyles.medium20Black.copyWith(color: AppColors.black),
  labelLarge: AppStyles.bold24Black.copyWith(color: AppColors.black),
  labelMedium: AppStyles.medium14Black.copyWith(color: AppColors.black),
  labelSmall: AppStyles.medium12Gray,
),

    iconTheme: const IconThemeData(color: Colors.black),
    dividerColor: AppColors.grey.withOpacity(0.2),
  );

  // ================== DARK THEME ==================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyles.medium24White,
      headlineMedium: AppStyles.medium20White,
      labelLarge: AppStyles.bold24White,
      labelMedium: AppStyles.medium14White,
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    dividerColor: AppColors.grey.withOpacity(0.3),
  );
}

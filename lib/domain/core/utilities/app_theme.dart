import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_news/domain/core/utilities/colors.dart';

class AppTheme {
  const AppTheme._();

  static final _lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColor,
      background: AppColors.whiteColor1,
      error: AppColors.errorColor,
      shadow: AppColors.blackColor1,
    ),
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    disabledColor: AppColors.grayColor1,
    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor, centerTitle: true, elevation: 10),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        color: AppColors.errorColor,
        fontSize: 24,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: AppColors.blackColor1,
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: AppColors.blackColor1,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontSize: 16,
        fontWeight: FontWeight.w200,
      ),
    ),
  );

  static final _darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColor,
      background: AppColors.blackColor1,
      error: AppColors.errorColor,
      shadow: AppColors.grayColor1,
    ),
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    disabledColor: AppColors.grayColor1,
    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor, centerTitle: true, elevation: 10),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        color: AppColors.errorColor,
        fontSize: 24,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: AppColors.blackColor1,
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: AppColors.blackColor1,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontSize: 16,
        fontWeight: FontWeight.w200,
      ),
    ),
  );

  static ThemeData light() {
    return _lightTheme;
  }

  static ThemeData dark() {
    return _darkTheme;
  }
}

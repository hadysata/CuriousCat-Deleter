import 'package:curiouscat_deleter/app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppThemes {
  static final main = ThemeData(
      fontFamily: DesignConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.primary,
      primaryColor: AppColors.primary,
      canvasColor: Colors.transparent,
      colorScheme: const ColorScheme.dark(
          primary: AppColors.secondary,
          onPrimary: AppColors.string1,
          secondary: AppColors.secondary,
          onSecondary: AppColors.string2),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: AppColors.string1,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
          displayLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900)),
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      backgroundColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
      ));
}

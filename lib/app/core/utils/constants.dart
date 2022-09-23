import 'package:flutter/material.dart';

export 'package:sizer/sizer.dart';

class DesignConstants {
  static const fontFamily = 'Cairo';

  static const borderRadius25 = BorderRadius.all(Radius.circular(25));
  static const borderRadius50 = BorderRadius.all(Radius.circular(50));
  static const borderRadius70 = BorderRadius.all(Radius.circular(70));

  static const kBoxShadow = [BoxShadow(blurRadius: 2, color: Colors.black12)];

  static const containerDecoration =
      BoxDecoration(color: AppColors.secondary, boxShadow: kBoxShadow, borderRadius: borderRadius25);

  static BoxDecoration containerCircularDecoration = containerDecoration.copyWith(borderRadius: borderRadius70);
}

class AppColors {
  static const primary = Color(0xFF171F2A);
  static const secondary = Color(0xFF1C2632);

  static const string1 = Color(0xFFFFFFFF);
  static const string2 = Color(0xFF8B98AA);

  static const green = Color(0xFF5BB88C);
  static const red = Color(0xFFEB4B62);
  static const purple = Color(0xFF5D5CDE);
  static const blue = Color(0xFF3A82F7);
}

class AppAssets {
  static const loginAnimation = "assets/animations/login_animation.json";
  static const loadingAnimation = "assets/animations/loading_animation.json";
}

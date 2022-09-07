import 'package:flutter/material.dart';
import 'package:mytask/common/style/colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      // minThumbLength: MediaQuery.of(context).size.height * 0.35,
      interactive: true,
      thickness: MaterialStateProperty.all(3),
      showTrackOnHover: true,
      mainAxisMargin: 10,

      isAlwaysShown: true,
      trackColor: MaterialStateProperty.all(const Color(0xff245793)),
      thumbColor: MaterialStateProperty.all(AppColors.white),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.mainColor,
    ),
  );
}

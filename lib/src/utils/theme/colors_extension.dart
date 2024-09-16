import 'package:flutter/material.dart';
import 'package:ibm_task/src/utils/colors/app_colors.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.grey,
    required this.lightBlue,
    required this.blue,
    required this.purple,
    required this.pink,
    required this.pinkDark,
  });
  final Color? grey;
  final Color? lightBlue;
  final Color? blue;
  final Color? purple;
  final Color? pink;
  final Color? pinkDark;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? grey,
    Color? lightBlue,
    Color? blue,
    Color? purple,
    Color? pink,
    Color? pinkDark,
 
  }) {
    return MyColors(
      grey: grey ,
      lightBlue: lightBlue,
      blue: blue,
      purple: purple,
      pink: pink,
      pinkDark: pinkDark,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      grey: grey,
      lightBlue: lightBlue,
      blue: blue,
      purple: purple,
      pink: pink,
      pinkDark: pinkDark,
    );
  }


  static const MyColors light = MyColors(
    grey: AppColors.grey,
    lightBlue: AppColors.lightBlue,
    blue: AppColors.blue,
    purple: AppColors.purple,
    pink: AppColors.pink, 
    pinkDark: AppColors.pinkDark,
  );
}
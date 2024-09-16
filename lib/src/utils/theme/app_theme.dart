import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';
import 'package:ibm_task/src/utils/theme/colors_extension.dart';


  ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
      extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
     textTheme: const   TextTheme(
      displayMedium: TextStyles.poppins16Bold,
      titleMedium: TextStyles.appBarTextStyle,
    ),
  );}

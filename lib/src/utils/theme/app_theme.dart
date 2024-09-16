import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';


  ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
     textTheme: const   TextTheme(
      displayMedium: TextStyles.poppins16Bold,
      titleMedium: TextStyles.appBarTextStyle,
    ),
  );}

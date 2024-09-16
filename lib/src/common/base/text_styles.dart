import 'package:flutter/material.dart';
import 'package:ibm_task/src/utils/colors/app_colors.dart';

class TextStyles {
  static const String poppins = 'Poppins';
  // font weight
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;

  // text styles
  static const   TextStyle appBarTextStyle = TextStyle(
    fontSize: 24.0, // Adjust font size to your preference
    fontFamily: poppins, // Set the font family (Poppins in this example)
    fontWeight: bold, // Set font weight to bold or adjust as needed
  );
  static  const  TextStyle poppins16Normal = TextStyle(
    fontSize: 16.0, // Adjust the font size for the label
    fontFamily: poppins, // Set the font family (Poppins in this example)
    fontWeight: normal, // Set the font weight for the label
  );
  static const  TextStyle poppins14Light = TextStyle(
    fontSize: 14.0, // Adjust font size for the hint text
    fontFamily: poppins, // Font family for hint text
    fontWeight: FontWeight.w300, // Lighter font weight for hint
  );
  static const   TextStyle poppins14Normal = TextStyle(
    fontSize: 14.0, // Font size for the "Forgot Password?" text
    fontFamily: poppins, // Font family (Poppins in this example)
    fontWeight: medium, // Semi-bold to make it noticeable
    color: AppColors.grey, // Set the color to blue to indicate a clickable link // Underline to give it a link-like appearance
  );
  static const  TextStyle poppins16Bold =  TextStyle(
      fontSize: 16.0,              // Font size for the button text
      fontFamily: poppins,       // Font family (Poppins or your chosen one)
      fontWeight: bold, // Bold font for emphasis
      color: Colors.white,         // Text color (usually matches foregroundColor)
    );
}

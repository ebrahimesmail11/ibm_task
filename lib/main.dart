import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/app.dart';
import 'package:ibm_task/src/common/storage/shared_preferences.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  await SharedPref().instantiatePreferences();
  runApp(const MyApp());
}


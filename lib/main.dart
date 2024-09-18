import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/app.dart';
import 'package:ibm_task/src/common/storage/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/common/base/app_constants.dart';
import 'src/common/storage/local_storage_helper.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  await SharedPref().instantiatePreferences();
  await checkIfLoggedInUser();
  runApp(const MyApp());
}
Future<void> checkIfLoggedInUser() async {
  // try {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(AppConstants.userAlreadyLoggedInKey)) {
      await LocalStorageHelper.deleteAll();
      isLoggedInUser = false;
    } else {
      await LocalStorageHelper.read(AppConstants.usertoken);
      isLoggedInUser =true;
  //     if (userToken == null || userToken.isEmpty) {
  //       print("No user token found.");
  //     } else {
  //       print("User token: $userToken");
  //     }
  //   }
  // } catch (error) {
  //   print("An error occurred: $error");
  // }
    }
}

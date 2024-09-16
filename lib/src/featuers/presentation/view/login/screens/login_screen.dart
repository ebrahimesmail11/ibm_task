import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';

import '../../../../../common/base/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsetsDirectional.only(
        start: 20.w,
        end: 20.w,
        top: 50.h,
        bottom: 20.h,
      ),
      children: [
        Text(
          AppConstants.login,
          style: context.titleMedium,
          textAlign: TextAlign.center,
        ),

      ],
    ));
  }
}

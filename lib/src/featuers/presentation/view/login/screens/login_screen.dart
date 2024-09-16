import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/animation/animation_do.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';
import 'package:ibm_task/src/featuers/presentation/view/login/widgets/login_button.dart';
import 'package:ibm_task/src/featuers/presentation/view/login/widgets/login_text_from_field.dart';
import 'package:ibm_task/src/featuers/presentation/view/login/widgets/socail_app_section.dart';

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
        CustomFadeInDown(
          duration: 400,
          child: Text(
            AppConstants.login,
            style: context.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40.h),
        const LoginTextFromField(),
        SizedBox(height: 20.h),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppConstants.forgotPassword,
            style: context.displayMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: TextStyles.bold,
              color: Colors.black.withOpacity(.3),
            ),
          ),
        ),
        SizedBox(height: 30.h),
        const LoginButton(),
        50.verticalSpace,
        CustomFadeInDown(
          duration: 600,
          child: Text(
            AppConstants.orUsingSignUp,
            style: context.displayMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: TextStyles.bold,
              color: Colors.black.withOpacity(.3),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        20.verticalSpace,
        const SocailAppSection(),
        140.verticalSpace,
        CustomFadeInDown(
          duration: 600,
          child: Text(
            AppConstants.orUsingSignUp,
            style: context.displayMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: TextStyles.bold,
              color: Colors.black.withOpacity(.3),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        20.verticalSpace,
        CustomFadeInDown(
          duration: 600,
          child: Text(
            AppConstants.signUp,
            style: context.displayMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: TextStyles.bold,
              color: Colors.black.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }
}

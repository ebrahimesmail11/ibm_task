import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/animation/animation_do.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/widgets/app_regex.dart';
import 'package:ibm_task/src/common/widgets/app_text_from_field.dart';

class LoginTextFromField extends StatefulWidget {
  const LoginTextFromField({super.key});

  @override
  State<LoginTextFromField> createState() => _LoginTextFromFieldState();
}

bool isShowPassword = true;

class _LoginTextFromFieldState extends State<LoginTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFadeInRight(
            duration: 400,
            child: Text(
            AppConstants.email,
            style: context.displayMedium!.copyWith(
              color: Colors.black.withOpacity(.4),
            ),
                    ),
          ),
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: AppConstants.typeYourUserName,
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: context.colors.grey,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (AppRegex.isEmailValid(p0!)) {
                  return AppConstants.validEmail;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          CustomFadeInRight(
            duration: 400,
            child: Text(
            AppConstants.password,
            style: context.displayMedium!.copyWith(
              color: Colors.black.withOpacity(.4),
            ),
                    ),
          ),
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: AppConstants.typeYourPassword,
              prefixIcon: Icon(
                Icons.lock,
                color: context.colors.grey,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (p0) {
                if (AppRegex.isPasswordValid(p0!)) {
                  return AppConstants.validPasswrod;
                }
                return null;
              },
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {});
                  isShowPassword = !isShowPassword;
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility : Icons.visibility_off,
                  color: context.colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

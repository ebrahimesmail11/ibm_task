import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/animation/animation_do.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';
import 'package:ibm_task/src/common/widgets/app_regex.dart';
import 'package:ibm_task/src/common/widgets/app_text_from_field.dart';
import 'package:ibm_task/src/featuers/presentation/providers/login/auth_provider_service.dart';
import 'package:ibm_task/src/featuers/presentation/view/login/widgets/login_button.dart';
import 'package:ibm_task/src/featuers/presentation/view_models.dart/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginTextFromField extends StatefulWidget {
  const LoginTextFromField({super.key});

  @override
  State<LoginTextFromField> createState() => _LoginTextFromFieldState();
}

bool isShowPassword = true;
final _formKey = GlobalKey<FormState>();
final _passwordController = TextEditingController();
final _emailController = TextEditingController();
final LoginViewModel loginViewModel = LoginViewModelImpl();
class _LoginTextFromFieldState extends State<LoginTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              controller: _emailController,
              hintText: AppConstants.typeYourUserName,
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: context.colors.grey,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                 if (!AppRegex.isEmailValid(p0!)) {
                  return AppConstants.validEmail; // Return error message if invalid
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
              controller: _passwordController,
              hintText: AppConstants.typeYourPassword,
              prefixIcon: Icon(
                Icons.lock_outline,
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
           LoginButton(onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthProviderService>().shouldShowCircleIndicator(true);
                            final email  =
                                _emailController.text;
                            final password = _passwordController.text;
                            loginViewModel.login(
                                email,
                                password,
                                context,
                               );
                              //  context.pushReplacementNamed();
                          } else {
                            context
                                .read<AuthProviderService>()
                                .shouldShowCircleIndicator(false);
                          }
           },),
        ],
      ),
    );
  }
}

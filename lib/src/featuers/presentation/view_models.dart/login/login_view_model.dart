import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/app_exception.dart';

import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';
import 'package:ibm_task/src/common/network/models/login/login_failure.dart';
import 'package:ibm_task/src/common/network/models/login/login_success.dart';
import 'package:ibm_task/src/common/network/service/failure.dart';
import 'package:ibm_task/src/common/routing/routes.dart';
import 'package:ibm_task/src/common/storage/shared_preferences.dart';
import 'package:ibm_task/src/featuers/domain/usecases/login_usecases.dart';
import 'package:ibm_task/src/featuers/presentation/providers/login/auth_provider_service.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:provider/provider.dart';

abstract class LoginViewModel {
  Future<void> login(
    String email,
    String password,
    BuildContext context,
   
    
  );
  void navigateTo(BuildContext context, LoginSuccess successModel);
}

class LoginViewModelImpl implements LoginViewModel {
 final LoginUseCase loginUseCase;
  LoginViewModelImpl({
    LoginUseCase? usecase,
  }) :
    loginUseCase = usecase ?? LoginUseCaseImpl(null);

  @override
  Future <void> login(
      String email, String password,BuildContext context, ) async {
    try {
      final response = await loginUseCase.request(email, password);
             log('${response.message}');
             
      if (response is LoginSuccess && context.mounted) {
        SharedPref().setString(response.data?.email ?? '');
        context.pushReplacementNamed(Routes.home);
         MotionToast.success(
                title:   Text('Done SuccessFully', style: context.displayMedium!.copyWith(
          fontSize: 14.sp,
          color: context.colors.registerSuccessful,
        ),), description:  Text('${response.message}', style: context.displayMedium!.copyWith(
          fontSize: 14.sp,
          color: context.colors.registerSuccessful,
        ),),)
            .show(context);
      }else if(response is LoginFailure && context.mounted){
          MotionToast.error(
                title: const Text('error title',), description: Text('${response.message}'),)
            .show(context);
      }
    } catch (error) {

// log('Error for Login Message $error');

      error as Failure;
      if (context.mounted) {
        context.read<AuthProviderService>().shouldShowCircleIndicator(false);

        MotionToast.error(
                title: const Text('error title',), description: Text(error.message),)
            .show(context);
      }
      if (error.runtimeType == AppException) {
        error as AppException;
      }
    }
  }

  @override
  void navigateTo(BuildContext context, LoginSuccess successModel) {
     context.pushReplacementNamed(Routes.home);
  }
  showAlertDialog(
      BuildContext context, String description, int errorStatusCode) {
    Widget continueButton = TextButton(
      child: Text(
        errorStatusCode == 402
            ? AppConstants.continueButton
            : AppConstants.okTitle,
        style: context.displayMedium!.copyWith(
          fontSize: 14.sp,
          color: context.colors.forgetPasswordText,
        ),
      ),
      onPressed: () {
        context.pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        errorStatusCode == 402 ? AppConstants.sorry : AppConstants.unauthorized,
        style: context.displayMedium!.copyWith(
          fontSize: 20.sp,
          fontWeight: TextStyles.bold,
        ),
      ),
      content: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: Text(
            description,
            style: context.displayMedium!.copyWith(
              fontSize: 16.sp,
              height: 1.5,
              color: context.colors.registerSuccessful,
              fontWeight: TextStyles.normal,
            ),
          ),
        );
      }),
      actions: [continueButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

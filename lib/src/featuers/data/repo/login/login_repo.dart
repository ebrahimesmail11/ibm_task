import 'dart:developer';

import 'package:ibm_task/src/common/base/app_exception.dart';
import 'package:ibm_task/src/common/network/models/login/login_failure.dart';
import 'package:ibm_task/src/common/network/models/login/login_success.dart';
import 'package:ibm_task/src/featuers/data/remote/login/login_remote.dart';

abstract class LoginRepo {
  Future<dynamic> getUserData(
      {Map<String, String> headers = const {},
      Map<String, dynamic>? body = const {}});
}

class LoginRepoImpl implements LoginRepo {
  late LoginRemote _remote;
  LoginRepoImpl(LoginRemote? remote) {
    _remote = remote ?? LoginRemoteImpl();
  }
  @override
  Future<dynamic> getUserData(
      {Map<String, String> headers = const {},
      Map<String, dynamic>? body = const {}}) async {
    try {
      dynamic response =
          await _remote.getData(headers: headers, body: body ?? {});
             log(response.toString());  
      if (response['status'] == true) {
        return LoginSuccess.fromJson(response);
      } else {
        return LoginFailure(status: false);
      }
    } catch (exception) {
      if (exception.runtimeType == AppException) {
        exception as AppException;
      }
      return Future.error(exception);
    }
  }
}

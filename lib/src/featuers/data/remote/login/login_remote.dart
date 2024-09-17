import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/network/service/network_service.dart';

abstract class LoginRemote {
  Future<dynamic> getData({
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
    Map<String, dynamic> body,
  });
}

class LoginRemoteImpl implements LoginRemote {
  @override
  Future<dynamic> getData(
      {Map<String, dynamic> queryParameters = const {},
      Map<String, String > headers = const {},
      Map<String, dynamic> body = const {}}) async {
    http.Response response = await NetworkService().makeHttpCall(
      callType: HttpCallType.post,
      body: json.encode(body),
      customHeaders: headers,
      url: AppConstants.loginEndPoint,
    );
    return json.decode(response.body);
  }
}


import 'package:flutter/material.dart';


import 'package:ibm_task/src/common/network/service/network_service.dart';

import '../../../../common/network/models/login/login_success.dart';

class AuthProviderService with ChangeNotifier {
 Data? _data; 
NetworkService networkService = NetworkService();
bool circleIndicator = false;
  Data? get data => _data;

  void setUser(Data ? data ){
    _data= data;
    notifyListeners();
  }
 void shouldShowCircleIndicator(bool shouldShowCircleIndicator) {
    circleIndicator = shouldShowCircleIndicator;
    notifyListeners();
  }
  // Future<Data?> getUser(String token, String email, int id ) async {
  //  final headers={
  //    'Content-Type': 'application/json',
  //    'Authorization': 'Bearer $token',
  //  };
  //  try{
  //   final  response = await networkService.makeHttpCall(
  //     callType: HttpCallType.get,
  //     url: AppConstants.loginEndPoint,
  //     customHeaders: headers
  //   );
  //   if(response.statusCode == 200){
  //     final decodedResponse = json.decode(response.body);
  //     final tempUser=Data.fromJson(decodedResponse);
  //      _data = tempUser;
  //      return tempUser;
  //   }else{
  //      throw Exception("There is some problem with getting users data.");
  //   }

  //  }catch (error) {
  //       log(error.toString());
  //       throw Exception("Failed to fetch get users data");
  //     }
  // }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/network/models/home/person.dart';


import 'package:ibm_task/src/common/network/service/network_service.dart';


class AuthProviderService with ChangeNotifier {
 Person? _person; 
NetworkService networkService = NetworkService();
bool circleIndicator = false;
  Person? get person => _person;

  void setUser(Person ? person ){
    _person= person;
    notifyListeners();
  }
 void shouldShowCircleIndicator(bool shouldShowCircleIndicator) {
    circleIndicator = shouldShowCircleIndicator;
    notifyListeners();
  }
  // Future<Person?> getUser(String token, String email, int id ) async {
  //  final headers={
  //    'Content-Type': 'application/json',
  //    'Authorization': 'Bearer $token',
  //  };
  //  try{
  //   final  response = await networkService.makeHttpCall(
  //     callType: HttpCallType.get,
  //     url: AppConstants.homeEndPoint,
  //     customHeaders: headers
  //   );
  //   if(response.statusCode == 200){
  //     final decodedResponse = json.decode(response.body);
  //     final tempUser=Person.fromJson(decodedResponse);
  //      _person = tempUser;
  //      return tempUser;
  //   }else{
  //      throw Exception("There is some problem with getting users data.");
  //   }

  //  }catch (error) {
  //       throw Exception("Failed to fetch get users data");
  //     }
  // }
}
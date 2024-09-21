import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/network/models/home/person.dart';
import 'package:ibm_task/src/common/network/service/network_service.dart';

abstract class HomeRepo {
Future<List<Person>> getHomeData(String userName);
}
class HomeRepoImp implements HomeRepo{
 // ignore: unused_field
 late final NetworkService? _networkService;
 HomeRepoImp(NetworkService? networkService) {
    _networkService = networkService ?? NetworkService();
  }

  @override
  Future<List<Person>> getHomeData(String userName) async{
     http.Response response = await _networkService!.makeHttpCall(
      callType: HttpCallType.get,
      url: '${AppConstants.homeEndPoint}$userName',
      customHeaders: {
        "Content-Type": "application/json",
      },
      body: '{}',
    );
    if(response.statusCode ==200){
      // return getPersonHome(response);
   final jsonBody =jsonDecode(response.body) as List  ;
    final person = jsonBody.map((e){
     return Person(
      id: e['id'],
      message: e['message'],
      image: e['image'],
      isActive: e['isActive'],
      time: e['time'],
      userName: e['userName'],
     );
    }).toList();
      return person;
    }else{
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
List<Person> getPersonHome(response){
   final jsonBody = jsonDecode(response.body) as List;
        final List<Person> personList = jsonBody.map((json) {
          return Person.fromJson(json);
        }).toList();
        return personList;
}
}
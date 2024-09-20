import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/network/models/home/person.dart';
import 'package:ibm_task/src/common/network/service/network_service.dart';

abstract class HomeRepo {
Future<List<Person>> getHomeData();
}
class HomeRepoImp implements HomeRepo{
 late final NetworkService? _networkService;
 HomeRepoImp(NetworkService? networkService) {
    _networkService = networkService ?? NetworkService();
  }

  @override
  Future<List<Person>> getHomeData() async{
     http.Response response = await NetworkService().makeHttpCall(
      callType: HttpCallType.get,
      url: AppConstants.homeEndPoint,
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
    }
   throw Exception('Failed to fetch providers data');
  }
List<Person> getPersonHome(responsenody){
  final jsonBody=jsonDecode(responsenody);
  final person = List<Person>.from(jsonBody.map((e)=>Person.fromJson(e)),);
  return person;
}
}
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:ibm_task/src/common/base/app_constants.dart';
// import 'package:ibm_task/src/common/network/models/home/person.dart';
// import 'package:ibm_task/src/common/network/service/network_service.dart';

// abstract class HomeRepo {
//   Future<List<Person>> getHomeData();
// }

// class HomeRepoImp implements HomeRepo {
//    final NetworkService _networkService;

//   // HomeRepoImp(NetworkService? networkService) {
//   //   _networkService = networkService ?? NetworkService();
//   // }
  // HomeRepoImp({
  //  NetworkService? networkService
  // }) :
  //   _networkService = networkService ?? NetworkService();

//   @override
//   Future<List<Person>> getHomeData() async {
//     // Make the HTTP call to the endpoint
//     http.Response response = await _networkService.makeHttpCall(
//       callType: HttpCallType.get,
//       url: AppConstants.homeEndPoint,
//     );

//     // Check if the response status is OK (200)
//     if (response.statusCode == 200) {
//       // Decode the response body as JSON
//       final List<dynamic> jsonBody = jsonDecode(response.body) as List<dynamic>;

//       // Map the JSON response to a list of Person objects
//       final List<Person> persons = jsonBody.map((json) {
//         return Person(
//           id: json['id'],
//           message: json['message'],
//           image: json['image'],
//           isActive: json['isActive'],
//           time: json['time'],
//           userName: json['userName'],
//         );
//       }).toList();

//       return persons;
//     } else {
//       // Handle the case when the response is not 200
//       throw Exception('Failed to fetch home data, status code: ${response.statusCode}');
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/network/models/home/person.dart';
import 'package:ibm_task/src/featuers/data/repo/home/home_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final homeRepo=HomeRepoImp(null); 
  List<Person>? _person;
  List<Person>? get person=>_person;
   bool showLoader = false;
  Future<void> getData() async{
      showLoader = true;
     notifyListeners();
    try{
      final response=await homeRepo.getHomeData();
      _person=response;
      showLoader=false; 
      notifyListeners();
      
    }catch (e) {
       throw Exception("Failed to fetch governorates: $e.");
    }
  } 
}
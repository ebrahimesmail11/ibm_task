import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/network/models/home/person.dart';
import 'package:ibm_task/src/featuers/data/repo/home/home_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final homeRepo = HomeRepoImp(null);
   List<Person>? _person;
   List<Person>? get person => _person;
   List<Person>? _filteredPerson; // القائمة المفلترة
  List<Person>? get filteredPerson => _filteredPerson;
  bool showLoader = false;
  String? errorMessage;
  Future<void> getData(String userName) async {
    showLoader = true;
    errorMessage = null;
    notifyListeners();
    try {
      final response = await homeRepo.getHomeData(userName);
      _person = response;
      showLoader = false;
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to fetch governorates: $e.");
    } finally {
      showLoader = false;
      notifyListeners();
    }
  }

  void searchByName(String name) {
    if (name.isEmpty) {
      _filteredPerson = _person;
    } else {
      _filteredPerson = person
          ?.where((person) =>
              person.userName!.toLowerCase().contains(name.toLowerCase()))
          .toList();
          notifyListeners();
    }
  }
}

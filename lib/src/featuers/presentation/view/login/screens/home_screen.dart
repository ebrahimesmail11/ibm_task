import 'package:flutter/material.dart';
import 'package:ibm_task/src/featuers/presentation/view_models.dart/login/login_view_model.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final LoginViewModel loginViewModel = LoginViewModelImpl();
  @override
  Widget build(BuildContext context) {
    return const   Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
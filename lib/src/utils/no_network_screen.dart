import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/base/app_images.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.noNetwork),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
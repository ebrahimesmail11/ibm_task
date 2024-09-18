import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/routing/route_manger.dart';
import 'package:ibm_task/src/common/routing/routes.dart';
import 'package:ibm_task/src/featuers/presentation/providers/login/auth_provider_service.dart';
import 'package:ibm_task/src/utils/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProviderService()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IBM Task',
            theme: themeLight(),
            initialRoute:  Routes.login,
            onGenerateRoute: RouteManger.generateRoute,
          ),
        );
      },
    );
  }
}
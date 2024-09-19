import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/routing/route_manger.dart';
import 'package:ibm_task/src/common/routing/routes.dart';
import 'package:ibm_task/src/featuers/presentation/providers/login/auth_provider_service.dart';
import 'package:ibm_task/src/featuers/presentation/view_models.dart/home/home_view_model.dart';
import 'package:ibm_task/src/utils/connectivity_controller.dart';
import 'package:ibm_task/src/utils/no_network_screen.dart';
import 'package:ibm_task/src/utils/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, child) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => AuthProviderService()),
                  ChangeNotifierProvider(create: (_)=>HomeViewModel()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'IBM Task',
                  theme: themeLight(),
                  builder: (context, child) {
                    return GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Scaffold(
                        body: Builder(
                          builder: (context) {
                            ConnectivityController.instance.init();
                            return child!;
                          },
                        ),
                      ),
                    );
                  },
                  initialRoute:isLoggedInUser ? Routes.home : Routes.login,
                  onGenerateRoute: RouteManger.generateRoute,
                ),
              );
            },
          );
        } else {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IBM Task',
            theme: themeLight(),
            home:const  NoNetworkScreen(),
          );
        }
      },
    );
  }
}

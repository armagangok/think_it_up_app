import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:think_it_up_app/core/navigation/constant/routes.dart';

import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/pages/login/login.dart';
import 'global/initilization/initapp.dart';

void main() async => await initApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme().darkTheme,
        home: const LoginPage(),
        initialRoute: KRoute.loginPage,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}

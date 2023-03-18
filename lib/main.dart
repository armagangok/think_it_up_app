import 'dart:developer';

import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'features/auth/presentation/pages/login/login.dart';
import 'global/initilization/initapp.dart';

void main() async => await initApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().darkTheme,
      home: const LoginPage(),
    );
  }
}

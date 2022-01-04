import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/theme/theme.dart';
import 'package:think_it_up_app/core/initilization/initapp.dart';
import 'app/views/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
  initApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme().darkTheme,
      home: const DashBoardView(),
    );
  }
}

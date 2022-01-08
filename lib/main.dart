import 'package:flutter/material.dart';
import 'app/theme/theme.dart';
import 'app/views/dashboard/dashboard.dart';
import 'background/initilization/initapp.dart';

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

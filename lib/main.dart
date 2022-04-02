import 'package:flutter/material.dart';
import 'core/theme/theme.dart';
import 'global/initilization/initapp.dart';
import 'screens/root.dart';

void main() async => await initApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme().darkTheme,
      home: const RootView(),
    );
  }
}

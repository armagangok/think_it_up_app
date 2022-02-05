import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/screens/root.dart';
import 'core/theme/theme.dart';
import 'global/initilization/initapp.dart';
import 'global/provider/provider_helper.dart';

void main() async {
  await initApp();
  runApp(
    MultiProvider(
      providers: ProviderHelper().providers,
      child: const MyApp(),
    ),
  );
}

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
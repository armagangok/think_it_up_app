import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/app/views/root.dart';
import 'package:think_it_up_app/background/provider/provider_helper.dart';
import 'app/theme/theme.dart';
import 'background/initilization/initapp.dart';

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
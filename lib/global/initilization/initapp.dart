import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/global/provider/provider_helper.dart';

import '../../core/networking/firebase/locator/locator.dart';
import '../../main.dart';

Future<void> initApp() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


   runApp(
    MultiProvider(
      providers: ProviderHelper().providers,
      child: const MyApp(),
    ),
  );
}

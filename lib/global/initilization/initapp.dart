import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../injection/injection_container.dart';
import '../../main.dart';

Future<void> initApp() async {
  setupDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

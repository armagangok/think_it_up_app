import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../injection/injection_container.dart';
import '../../main.dart';
import '../helpers/screen_util_helper/screen_util.dart';

Future<void> initApp() async {
  setupDependencies();
  await ScreenUtilHelper.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

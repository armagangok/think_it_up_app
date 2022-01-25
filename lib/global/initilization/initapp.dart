import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../locator/locator.dart';

Future<void> initApp() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

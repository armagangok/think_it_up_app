import 'package:flutter/material.dart';

import '../contracts/switch_base.dart';

class ThemeProvider extends ChangeNotifier implements BaseSwitchVModel {
  @override
  bool switchVal = true;

  @override
  void changeSwitch() {
    switchVal = !switchVal;
    notifyListeners();
  }
}

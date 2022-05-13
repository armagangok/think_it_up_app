import 'package:flutter/material.dart';
import 'package:think_it_up_app/global/local/base/switch_base.dart';

class ThemeProvider extends ChangeNotifier implements BaseSwitchVModel {
  @override
  bool switchVal = true;

  @override
  void changeSwitch() {
    switchVal = !switchVal;
    notifyListeners();
  }
}

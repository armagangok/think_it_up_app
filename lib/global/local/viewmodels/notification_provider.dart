import 'package:flutter/material.dart';
import 'package:think_it_up_app/global/local/base/switch_base.dart';

class NotificationProvider extends ChangeNotifier implements BaseViewModel {
  @override
  bool switchVal = true;

  @override
  void changeSwitch() {
    switchVal = !switchVal;
    notifyListeners();
  }
}

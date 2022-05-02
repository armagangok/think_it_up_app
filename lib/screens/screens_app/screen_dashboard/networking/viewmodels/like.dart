import 'package:flutter/material.dart';
import 'package:think_it_up_app/global/local/base/icon_state_base.dart';

class LikeViewModel extends ChangeNotifier implements IconStateBase {
  @override
  bool isLiked = false;

  @override
  void like() {
    isLiked = !isLiked;
    notifyListeners();
  }
}

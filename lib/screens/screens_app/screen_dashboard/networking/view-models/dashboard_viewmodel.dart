import 'package:flutter/material.dart';

class DashVievmodel with ChangeNotifier {
  DashVievmodel._private();
  static final DashVievmodel _instance = DashVievmodel._private();
  factory DashVievmodel() => _instance;

  int indexOfComment = 0;
  void changeIndexOfComment(int index) => indexOfComment = index;
}

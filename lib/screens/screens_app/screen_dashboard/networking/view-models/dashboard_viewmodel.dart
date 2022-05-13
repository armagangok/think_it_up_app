import 'package:flutter/material.dart';

class DashboardVModel with ChangeNotifier {
  DashboardVModel._private();
  static final DashboardVModel _instance = DashboardVModel._private();
  factory DashboardVModel() => _instance;
}

import 'package:flutter/material.dart';

class CustomColor {
  static final CustomColor _singleton = CustomColor._internal();

  factory CustomColor() {
    return _singleton;
  }
  CustomColor._internal();
  Color bgColor = const Color(0xFF000000);
  Color mainColor = const Color(0xFF081c34);
}

import 'package:flutter/material.dart';

final CustomColor customColor = CustomColor();

class CustomColor {
  static final CustomColor _singleton = CustomColor._internal();

  factory CustomColor() {
    return _singleton;
  }
  CustomColor._internal();
  Color bgColor = const Color.fromRGBO(62, 62, 62, 1);
  Color contColor = const Color(0xFF2B2D32);
}

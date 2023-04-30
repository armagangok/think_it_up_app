import 'package:flutter/cupertino.dart';

CustomColor kColor = CustomColor();

class CustomColor {
  static final CustomColor _singleton = CustomColor._internal();
  factory CustomColor() => _singleton;
  CustomColor._internal();

  Color bgColor = const Color(0xff000000);
  Color mainColor = const Color(0xFF081c34);
  Color bottomSheet = const Color(0xFF646464);
  Color textField = const Color(0xFFC4C4C4);
} 

class ConstText {
  static final ConstText _singleton = ConstText._internal();
  factory ConstText() => _singleton;
  ConstText._internal();

  String error =
      "Invalid password or email. \n There may be an account with that email.";

  String verification = """\nHello There!\n
    Verification link has been sent your e-mail.\n
    Do you really think that you can signin without verification? \n""";
}

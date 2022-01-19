import 'package:flutter/material.dart';

final textControllers = TextControllers();

class TextControllers {
  final TextEditingController _usernameRegister = TextEditingController();
  final TextEditingController _emailRegister = TextEditingController();
  final TextEditingController _passwordRegister1 = TextEditingController();
  final TextEditingController _passwordRegister2 = TextEditingController();
  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  final TextEditingController _emailLogin = TextEditingController();
  final TextEditingController _passwordLogin = TextEditingController();
  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  final TextEditingController _emailForgotPassword = TextEditingController();
  final TextEditingController _enterCode = TextEditingController();
  final TextEditingController _newpassword1 = TextEditingController();
  final TextEditingController _newpassword2 = TextEditingController();

  get usernameRegister => _usernameRegister;
  get emailRegister => _emailRegister;
  get passwordRegister1 => _passwordRegister1;
  get passwordRegister2 => _passwordRegister2;
  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  get emailLogin => _emailLogin;
  get passwordLogin => _passwordLogin;
  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  get emailForgotPassword => _emailForgotPassword;
  get enterCode => _enterCode;
  get newpassword1 => _newpassword1;
  get newpassword2 => _newpassword2;

  String setusernameRegister(String newVal) => _usernameRegister.text = newVal;
  String setemailRegister(String newVal) => _emailRegister.text = newVal;
  String setpasswordRegister1(String newVal) =>
      _passwordRegister1.text = newVal;
  String setpasswordRegister2(String newVal) =>
      _passwordRegister2.text = newVal;
  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  String setEmailLogin(String newVal) => _emailLogin.text = newVal;
  String setpasswordLogin(String newVal) => _passwordLogin.text = newVal;
  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  String setemailForgotPassword(String newVal) =>
      _emailForgotPassword.text = newVal;
  String setenterCode(String newVal) => _enterCode.text = newVal;
  String setnewpassword1(String newVal) => _newpassword1.text = newVal;
  String setnewpassword2(String newVal) => _newpassword2.text = newVal;
}

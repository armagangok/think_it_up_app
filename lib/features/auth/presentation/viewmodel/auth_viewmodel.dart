import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';

class AuthViewModel with ChangeNotifier {
  late final AuthUseCase _authUseCase;

  AuthViewModel({
    required AuthUseCase authUseCase,
  }) {
    _authUseCase = authUseCase;
  }

  StateResult loginState = const StateResult.initial();

  Future<void> login({required UserLoginModel userModel}) async {
    try {
      var response = await _authUseCase.login(userModel: userModel);
      loginState = StateResult.completed(response);
      notifyListeners();
    } catch (e) {
      loginState = StateResult.failed(CustomFailure(message: "$e"));
      notifyListeners();
    }
  }

  Future<void> signout() async {
    try {} catch (e) {}
  }
}

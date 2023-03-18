import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:think_it_up_app/injection/injection_container.dart';

import '../../../../core/export/core_export.dart';

final authViewModel = ChangeNotifierProvider<AuthViewModel>(
  (ref) => getit.get<AuthViewModel>(),
);

class AuthViewModel with ChangeNotifier {
  late final AuthUseCase _authUseCase;

  AuthViewModel({
    required AuthUseCase authUseCase,
  }) {
    _authUseCase = authUseCase;
  }

  StateResult loginState = const StateResult.initial();

  Future<void> login({required UserLoginModel userModel}) async {
    loginState = const StateResult.loading();
    notifyListeners();

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

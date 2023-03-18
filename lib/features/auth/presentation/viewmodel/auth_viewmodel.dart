import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:think_it_up_app/injection/injection_service.dart';

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

  StateResult<AppUser?> loginState = const StateResult.initial();
  StateResult registerState = const StateResult.initial();

  Future<void> login({required UserLoginModel userModel}) async {
    loginState = const StateResult.loading();

    var response = await _authUseCase.login(userModel: userModel);

    response.when(
      success: (data) {
        loginState = StateResult.completed(data);
        notifyListeners();
        navigator.navigaToClear(path: KRoute.homePage);
      },
      failure: (failure) {
        loginState = StateResult.failed(failure);
        notifyListeners();
      },
    );
  }

  Future<void> register({required AppUser userModel}) async {
    registerState = const StateResult.loading();
    notifyListeners();

    var response = await _authUseCase.register(userModel: userModel);

    response.when(
      success: (data) {
        registerState = StateResult.completed(data);
        notifyListeners();
        navigator.navigaToClear(path: KRoute.loginPage);
      },
      failure: (failure) {
        registerState = StateResult.failed(failure);
        notifyListeners();
      },
    );
  }

  Future<void> signout() async {
    try {} catch (e) {}
  }
}

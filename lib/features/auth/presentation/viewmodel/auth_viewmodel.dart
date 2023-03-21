import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection/injection_service.dart';

import '/core/export/core_export.dart';

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
  StateResult<AppUser?> registerState = const StateResult.initial();
  StateResult logoutState = const StateResult.initial();

  Future<void> login({required UserLoginModel userModel}) async {
    loginState = const StateResult.loading();
    notifyListeners();

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

  Future<void> logout(HomeViewModel _homeViewModel) async {
    logoutState = const StateResult.loading();
    notifyListeners();

    var response = await _authUseCase.logout();

    response.when(
      success: (data) async {
        logoutState = StateResult.completed(data);
        notifyListeners();
        await _homeViewModel.checkCurrentUser();
      },
      failure: (failure) {
        logoutState = StateResult.failed(failure);
      },
    );
  }
}

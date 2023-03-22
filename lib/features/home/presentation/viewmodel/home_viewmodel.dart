import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection/injection_service.dart';
import '/core/export/core_export.dart';

final homeViewModel =
    ChangeNotifierProvider<HomeViewModel>((ref) => getit.get<HomeViewModel>());

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required HomeUseCase homeUseCase}) {
    _homeUseCase = homeUseCase;
    checkCurrentUser();
  }

  late final HomeUseCase _homeUseCase;

  final firebaseAuth = FirebaseAuth.instance;

  AppUser? _appUser;

  StateResult<AppUser?> currentUserState = const StateResult.initial();

  Future<void> checkCurrentUser() async {
    currentUserState = const StateResult.loading();
    var response = await _homeUseCase.checkCurrentUser();

    response.when(
      success: (currentUser) {
        currentUserState = StateResult.completed(currentUser);

        _appUser = currentUser;

        if (currentUser != null) {
          navigator.navigaToClear(path: KRoute.homePage);
        } else {
          navigator.navigaToClear(path: KRoute.loginPage);
        }
      },
      failure: (failure) {
        currentUserState = StateResult.failed(failure);
        navigator.navigaToClear(path: KRoute.loginPage);
      },
    );
  }

  AppUser? get getCurrentUser => _appUser;
}

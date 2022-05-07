import 'package:flutter/material.dart';

import '../services/auth_base.dart';
import '../locator/locator.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';

enum ViewState { idle, busy }

class FirebaseViewmodel with ChangeNotifier implements AuthBase {
  final UserRepository _userRepository = locator<UserRepository>();

  AppUser? _user;
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  AppUser? get user => _user;
  bool isPasswordCorrect = true;
  bool isMailCorrect = true;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  FirebaseViewmodel() {
    currentUser();
  }

  @override
  Future<AppUser?> currentUser() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("Error in viewmodel, at currenUser() method. \n [$e]");
      return null;
    } finally {
      state = ViewState.idle;
    } //finally runs wheter or not an error.
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.busy;
      bool credential = await _userRepository.signOut();
      _user = null;
      return credential;
    } catch (e) {
      debugPrint("Error in viewmodel, at signOut() method. \n [$e]");
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<AppUser?> signinAnonim() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signinAnonim();
      debugPrint("userViewModel user:  $_user");
      return _user;
    } catch (e) {
      debugPrint("Error in viewmodel, signinAnonim() method. \n [$e]");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<AppUser?> signInByGoogle() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInByGoogle();
      return _user;
    } catch (e) {
      debugPrint("Error in UserVievModel, at signInByGoogle() method. \n [$e]");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<AppUser?> createUserByEmailPassword(AppUser user) async {
    if (emailControl(user.email!)) {
      try {
        // passwordControll(user.password!, user.password2!);
        AppUser? _user = await _userRepository.createUserByEmailPassword(user);
        await verifyMail();

        return _user;
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<AppUser?> signInByEmailPassword(
    String email,
    String password,
  ) async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInByEmailPassword(
        email,
        password,
      );
      return _user;
    } catch (e) {
      debugPrint(
        "Error in UserVievModel, at signInByEmailPassword() method. \n [$e] \n ${e.hashCode};",
      );
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  bool? isVerified() {
    return _userRepository.isVerified();
  }

  @override
  Future<void> verifyMail() async {
    try {
      await _userRepository.verifyMail();
    } catch (e) {
      debugPrint("Error in UserVievModel, at verifyMail() method. \n [$e]");
    }
  }

  @override
  bool? isAnonim() {
    debugPrint("UserVievModel , at isANonim \n ${_userRepository.isAnonim()}");
    return _userRepository.isAnonim();
  }

  bool emailControl(String email) {
    if (email.contains("@")) {
      return true;
    } else {
      return false;
    }
  }

  // bool passwordControll(String password1, String password2) {
  //   if (password1 == password2 && password1.length > 6) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}

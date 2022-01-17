import 'package:flutter/material.dart';

import '../../../../locator/locator.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';
import '../services/auth_base.dart';


enum ViewState { idle, busy }

class UserViewModel with ChangeNotifier implements AuthBase {
  final UserRepository _userRepository = locator<UserRepository>();

  RenewedUser? _user;
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  RenewedUser? get user => _user;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserViewModel() {
    currentUser();
  }

  @override
  RenewedUser? currentUser() {
    try {
      state = ViewState.busy;
      _user = _userRepository.currentUser();
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
  Future<RenewedUser?> signinAnonim() async {
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
  Future<RenewedUser?> signInByGoogle() async {
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
  Future<RenewedUser?> createUserByEmailPassword(
    String email,
    String password1,
    String password2,
  ) async {
    if (password1.length < 7 && password2.length < 7) {
      debugPrint("Please make sure you input longer then 6 characters.");
      return null;
    } else if (password2 != password1) {
      debugPrint("Passwords are not same!");
      return null;
    } else {
      try {
        state = ViewState.busy;
        _user = await _userRepository.createUserByEmailPassword(
          email,
          password1,
          password2,
        );
        await verifyMail();

        return _user;
      } catch (e) {
        debugPrint(
            "Error in UserVievModel, at createUserByEmailPassword() method. \n [$e]");
        return null;
      } finally {
        state = ViewState.idle;
      }
    }
  }

  @override
  Future<RenewedUser?> signInByEmailPassword(
    String email,
    String password,
  ) async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInByEmailPassword(email, password);
      return _user;
    } catch (e) {
      debugPrint(
          "Error in UserVievModel, at signInByEmailPassword() method. \n [$e]");
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
}

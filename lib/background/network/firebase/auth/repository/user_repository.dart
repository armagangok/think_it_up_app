import '../../../../locator/locator.dart';
import '../../firestore/services/current_db_service.dart';
import '../models/user_model.dart';
import '../services/auth_base.dart';
import '../services/dummy_service.dart';
import '../services/services.dart';

enum AppMode { debug, release }

class UserRepository implements AuthBase {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final DummyService _dummyAuthService = locator<DummyService>();
  final CurrentDbService _currentDbService = locator<CurrentDbService>();

  AppMode appMode = AppMode.release;

  @override
  RenewedUser? currentUser() {
    if (appMode == AppMode.debug) {
      return _dummyAuthService.currentUser();
    } else {
      return _authService.currentUser();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.debug) {
      return await _dummyAuthService.signOut();
    } else {
      return await _authService.signOut();
    }
  }

  @override
  Future<RenewedUser?> signinAnonim() async {
    if (appMode == AppMode.debug) {
      return await _dummyAuthService.signinAnonim();
    } else {
      return await _authService.signinAnonim();
    }
  }

  @override
  Future<RenewedUser?> signInByGoogle() async {
    if (appMode == AppMode.debug) {
      return await _dummyAuthService.signInByGoogle();
    } else {
      return await _authService.signInByGoogle();
    }
  }

  @override
  Future<RenewedUser?> signInByEmailPassword(
    String email,
    String password,
  ) async {
    if (appMode == AppMode.debug) {
      return await _dummyAuthService.signInByEmailPassword(email, password);
    } else {
      return await _authService.signInByEmailPassword(email, password);
    }
  }

  @override
  Future<RenewedUser?> createUserByEmailPassword(
      String email, String password1, String password2) async {
    if (appMode == AppMode.debug) {
      return await _dummyAuthService.createUserByEmailPassword(
        email,
        password1,
        password2,
      );
    } else {
      final RenewedUser? _renewedUser = await _authService
          .createUserByEmailPassword(email, password1, password2);

      bool _result = await _currentDbService.saveUser(_renewedUser!);
      if (_result == true) {
        return _renewedUser;
      } else {
        return null;
      }
    }
  }

  @override
  bool? isVerified() {
    if (appMode == AppMode.debug) {
      return _dummyAuthService.isVerified();
    } else {
      return _authService.isVerified();
    }
  }

  @override
  Future<void> verifyMail() async {
    if (appMode == AppMode.debug) {
      await _dummyAuthService.verifyMail();
    } else {
      await _authService.verifyMail();
    }
  }

  @override
  bool? isAnonim() {
    if (appMode == AppMode.debug) {
      return _dummyAuthService.isAnonim();
    } else {
      return _authService.isAnonim();
    }
  }
}

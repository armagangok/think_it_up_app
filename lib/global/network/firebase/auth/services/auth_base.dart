import '../models/user_model.dart';

abstract class AuthBase {
  AppUser? currentUser();
  Future<AppUser?> signinAnonim();
  Future<bool> signOut();
  Future<AppUser?> signInByGoogle();
  Future<AppUser?> signInByEmailPassword(String email, String password);
  Future<AppUser?> createUserByEmailPassword(AppUser appUser);
  bool? isVerified();
  Future<void> verifyMail();
  bool? isAnonim();
}

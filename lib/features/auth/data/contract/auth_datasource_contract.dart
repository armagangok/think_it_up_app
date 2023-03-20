import '../../../../core/export/core_export.dart';

abstract class AuthDataSourceContract {
  Future<AppUser?> login({required UserLoginModel userModel});
  Future<void> logout();
  Future<AppUser?> register({required AppUser user});
}

import '../../../../core/export/core_export.dart';

abstract class AuthDataSourceContract {
  Future<AppUser?> login({required UserLoginModel userModel});
  Future<AppUser?> register({required AppUser user});
}

import '/core/export/core_export.dart';

abstract class AuthRepositoryContract {
  Future<Result<AppUser?>> login({required UserLoginModel userModel});
  Future<Result> logout();
  Future<Result<AppUser?>> register({required AppUser userModel});
}

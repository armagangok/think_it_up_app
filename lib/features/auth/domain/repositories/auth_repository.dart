// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:think_it_up_app/core/export/core_export.dart';

class AuthRepository implements AuthRepositoryContract {
  late final AuthDataSourceContract _loginDataSource;

  @override
  AuthRepository({
    required AuthDataSourceContract loginDataSource,
  }) {
    _loginDataSource = loginDataSource;
  }

  @override
  Future<Result<AppUser?>> login({required UserLoginModel userModel}) async {
    try {
      var response = await _loginDataSource.login(userModel: userModel);
      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }

  @override
  Future<Result<AppUser?>> register({required AppUser userModel}) async {
    try {
      var response = await _loginDataSource.register(user: userModel);
      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }

  @override
  Future<Result> logout() async {
    try {
      await _loginDataSource.logout();
      return const Result.success(true);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }
}

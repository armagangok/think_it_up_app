import '/core/export/core_export.dart';

class AuthUseCase {
  AuthUseCase({required AuthRepositoryContract authRepository}) {
    _authRepository = authRepository;
  }
  late final AuthRepositoryContract _authRepository;

  Future<Result<AppUser?>> login({required UserLoginModel userModel}) async {
    var response = await _authRepository.login(userModel: userModel);
    return response;
  }

  Future<Result<AppUser?>> register({required AppUser userModel}) async {
    var response = await _authRepository.register(userModel: userModel);
    return response;
  }

  Future<Result> logout() async {
    var response = await _authRepository.logout();
    return response;
  }
}

import '/core/export/core_export.dart';

class HomeUseCase {
  HomeUseCase({required HomeRepository homeRepository}) {
    _authRepository = homeRepository;
  }
  late final HomeRepository _authRepository;

  Future<Result<AppUser?>> checkCurrentUser() async {
    var response = await _authRepository.checkCurrentUser();
    return response;
  }
}

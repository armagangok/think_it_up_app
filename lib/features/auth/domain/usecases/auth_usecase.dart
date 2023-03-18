import 'package:think_it_up_app/features/auth/domain/contract/auth_repository.dart';

import '../../../../core/networking/firebase/models/user_model.dart';
import '../../data/models/user_login_model.dart';

class AuthUseCase {
  AuthUseCase({required AuthRepositoryContract authRepository}) {
    _authRepository = authRepository;
  }
  late final AuthRepositoryContract _authRepository;

  Future<AppUser?> login({required UserLoginModel userModel}) async {
    return await _authRepository.login(userModel: userModel);
  }
}

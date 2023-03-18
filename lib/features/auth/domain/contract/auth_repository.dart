import '../../../../core/networking/firebase/models/user_model.dart';
import '../../data/models/user_login_model.dart';

abstract class AuthRepositoryContract {
  Future<AppUser?> login({required UserLoginModel userModel});
}

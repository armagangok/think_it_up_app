import 'package:think_it_up_app/features/auth/data/models/user_login_model.dart';

import '../../../../core/networking/firebase/models/user_model.dart';

abstract class LoginDataSourceContract {
  Future<AppUser?> login({required UserLoginModel userModel});
}

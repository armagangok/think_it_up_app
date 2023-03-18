// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/core/networking/firebase/models/user_model.dart';
import '/features/auth/data/contract/login_datasource_contract.dart';
import '/features/auth/data/models/user_login_model.dart';
import '/features/auth/domain/contract/auth_repository.dart';

class AuthRepository implements AuthRepositoryContract {
  late final LoginDataSourceContract _loginDataSource;

  @override
  AuthRepository({
    required LoginDataSourceContract loginDataSource,
  }) {
    _loginDataSource = loginDataSource;
  }

  @override
  Future<AppUser?> login({required UserLoginModel userModel}) async {
    try {
      return await _loginDataSource.login(userModel: userModel);
    } catch (e) {
      return null;
    }
  }
}

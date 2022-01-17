



import '../../auth/models/user_model.dart';

abstract class DbBase {
  Future<bool> saveUser(RenewedUser user);
}

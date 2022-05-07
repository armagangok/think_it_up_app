import '../../../../core/networking/firebase/models/user_model.dart';

class UserViewmodel {
  AppUser? _appUser;

  AppUser? get getAppUser => _appUser;
  set setAppUser(AppUser appUser) => _appUser = appUser;
}

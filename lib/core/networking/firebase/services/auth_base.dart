import '../../../../../core/networking/firebase/models/user_model.dart';
import '../../../../screens/screens_app/screen_dashboard/networking/models/post_model.dart';

abstract class AuthBase {
  Future<AppUser?> currentUser();
  Future<AppUser?> signinAnonim();
  Future<bool> signOut();
  Future<AppUser?> signInByGoogle();
  Future<AppUser?> signInByEmailPassword(String email, String password);
  Future<AppUser?> createUserByEmailPassword(AppUser appUser);
  bool? isVerified();
  Future<void> verifyMail();
  bool? isAnonim();
  Future<void> setLikedPostID(PostModel post, AppUser user);

}

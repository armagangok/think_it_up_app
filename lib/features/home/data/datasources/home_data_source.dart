import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../auth/data/models/in_app_user_model.dart';
import '../contract/home_data_source.dart';

class HomeDataSource implements HomeDataSourceContract {
  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firestore;
  HomeDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  }) {
    _firebaseAuth = firebaseAuth;
    _firestore = firebaseFirestore;
  }
  @override
  Future<AppUser?> checkCurrentUser() async {
    return _firebaseAuth.currentUser != null
        ? await _userFromFirebase(_firebaseAuth.currentUser)
        : null;
  }

  Future<AppUser?> _userFromFirebase(User? user) async {
    if (user == null) {
      return null;
    } else {
      DocumentSnapshot<Map<String, dynamic>> userFromFirebase =
          await _firestore.collection("users").doc(user.uid).get();
      return AppUser(
        email: userFromFirebase["email"],
        password: userFromFirebase["password"],
        passwordRepeat: "",
        id: user.uid,
        userName: userFromFirebase["userName"],
        likedPostsIDS: userFromFirebase["likedPosts"],
      );
    }
  }
}

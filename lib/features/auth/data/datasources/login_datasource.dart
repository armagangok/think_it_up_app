// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/core/networking/firebase/models/user_model.dart';
import '/features/auth/data/contract/login_datasource_contract.dart';
import '/features/auth/data/models/user_login_model.dart';

class LoginDataSource implements LoginDataSourceContract {
  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firestore;
  LoginDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  }) {
    _firebaseAuth = firebaseAuth;
    _firestore = firebaseFirestore;
  }

  @override
  Future<AppUser?> login({required UserLoginModel userModel}) async {
    UserCredential authCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: userModel.email,
      password: userModel.password,
    );
    return await _userFromFirebase(authCredential.user);
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
        id: user.uid,
        userName: userFromFirebase["userName"],
        likedPostsIDS: userFromFirebase["likedPosts"],
      );
    }
  }
}

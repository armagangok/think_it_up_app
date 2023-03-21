// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/core/export/core_export.dart';

class AuthDataSource implements AuthDataSourceContract {
  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firestore;
  AuthDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  }) {
    _firebaseAuth = firebaseAuth;
    _firestore = firebaseFirestore;
  }

  @override
  Future<AppUser?> login({required UserLoginModel userModel}) async {
    if (_firebaseAuth.currentUser != null) {
      return await _userFromFirebase(_firebaseAuth.currentUser!);
    } else {
      UserCredential authCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      await _userFromFirebase(authCredential.user);
    }
    return null;
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

  @override
  Future<AppUser?> register({required AppUser user}) async {
    UserCredential authCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    user.setID = authCredential.user!.uid;

    await _firestore
        .collection("users")
        .doc(authCredential.user!.uid)
        .set(user.toMap());

    return _userFromFirebase(authCredential.user);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}

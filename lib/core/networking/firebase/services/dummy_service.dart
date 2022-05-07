import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/networking/firebase/models/user_model.dart';
import '../../../../screens/screens_app/screen_dashboard/networking/models/post_model.dart';
import 'auth_base.dart';

class DummyService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<AppUser?> currentUser() async {
    try {
      User? user = _firebaseAuth.currentUser;
      return await _userFromFirebase(user);
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }

  Future<AppUser?> _userFromFirebase(User? user) async {
    if (user == null) {
      return null;
    } else {
      return AppUser(
        id: "id",
        email: "email",
        userName: "userName",
        password: 'admin',
        likedPosts: [],
      );
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("$e");
      return false;
    }
  }

  @override
  Future<AppUser?> signinAnonim() async {
    try {
      UserCredential authCredential = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(authCredential.user);
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }

  @override
  Future<AppUser?> signInByGoogle() async {
    try {
      UserCredential authCredential = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(authCredential.user);
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }

  @override
  Future<AppUser?> signInByEmailPassword(String email, String password) async {
    return AppUser(
      id: "id",
      email: "email",
      userName: "userName",
      password: 'admin',
      likedPosts: [],
    );
  }

  @override
  Future<AppUser?> createUserByEmailPassword(AppUser user) async {
    return AppUser(
      id: "id",
      email: "email",
      userName: "userName",
      password: 'admin',
      likedPosts: [],
    );
  }

  @override
  bool? isVerified() => true;

  @override
  Future<bool> verifyMail() async {
    return await Future.value(true);
  }

  @override
  bool? isAnonim() => true;

  @override
  Future<void> setLikedPostID(PostModel post, AppUser user) async{
    
  }
}

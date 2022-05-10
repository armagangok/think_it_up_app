import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/networking/firebase/models/user_model.dart';
import 'auth_base.dart';

class CurrentService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  @override
  Future<bool> signOut() async {
    debugPrint("current user state: " "${_firebaseAuth.currentUser}");
    try {
      final GoogleSignIn _googleSigniIn = GoogleSignIn();
      if (_googleSigniIn.currentUser != null) {
        await _googleSigniIn.signOut();
      }

      if (_firebaseAuth.currentUser?.isAnonymous == true) {
        debugPrint(
            "anonim user state: ${_firebaseAuth.currentUser?.isAnonymous}");
        await _firebaseAuth.currentUser?.delete();
      } else {
        debugPrint(
            "anonim user state: ${_firebaseAuth.currentUser?.isAnonymous}");
      }
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("error in services at signOut: [$e]");
      return false;
    }
  }

  @override
  Future<AppUser?> signinAnonim() async {
    try {
      UserCredential authCredential = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(authCredential.user);
    } catch (e) {
      debugPrint("Error in Services, at siginAnonim [$e]");
      return null;
    }
  }

  @override
  Future<AppUser?> signInByGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      final GoogleSignInAuthentication _googleAuth =
          await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential _credential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: _googleAuth.idToken,
            accessToken: _googleAuth.accessToken,
          ),
        );
        final User? _user = _credential.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<AppUser?> createUserByEmailPassword(AppUser user) async {
    try {
      UserCredential authCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      user.setID = authCredential.user!.uid;

      await _firestore
          .collection("users")
          .doc(authCredential.user!.uid)
          .set(user.toMap());

      return _userFromFirebase(authCredential.user);
    } catch (e) {
      debugPrint("Error in services, at createUserWithEmailAndPassword: [$e]");
      return null;
    }
  }

  @override
  Future<AppUser?> signInByEmailPassword(String email, String password) async {
    try {
      // debugPrint(
      //     "DEBUG in FirebaseAuthService at signInByEmailPassword. \n  S${_firebaseAuth.currentUser?.emailVerified}");
      UserCredential authCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authCredential.user);
    } catch (e) {
      debugPrint("Error in services, signInWithEmailAndPassword: [$e]");
      return null;
    }
  }

  // @override
  // bool? isVerified() {
  //   bool? isVerified = _firebaseAuth.currentUser?.emailVerified;
  //   return isVerified;
  // }

  // @override
  // Future<void> verifyMail() async {
  //   await _firebaseAuth.currentUser?.sendEmailVerification();
  // }

  @override
  bool? isAnonim() {
    debugPrint("isAnonim: [${_firebaseAuth.currentUser?.isAnonymous}]");
    return _firebaseAuth.currentUser?.isAnonymous;
  }

  @override
  Future<void> setLikedPostID(AppUser user, String likedPosts) async {
    DocumentReference a = _firestore.collection("users").doc(user.id);
    await a.set({"likedPosts": likedPosts}, SetOptions(merge: true));
  }
}

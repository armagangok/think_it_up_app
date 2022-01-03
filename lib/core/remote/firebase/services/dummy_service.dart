// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../models/user_model.dart';
// import 'auth_base.dart';

// class DummyService implements AuthBase {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   @override
//   RenewedUser? currentUser() {
//     try {
//       User? user = _firebaseAuth.currentUser;
//       return _userFromFirebase(user);
//     } catch (e) {
//       debugPrint("$e");
//       return null;
//     }
//   }

//   RenewedUser? _userFromFirebase(User? user) {
//     if (user == null) {
//       return null;
//     } else {
//       return RenewedUser(email: 'sample@email.com', id: 'sample3546346346');
//     }
//   }

//   @override
//   Future<bool> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//       return true;
//     } catch (e) {
//       debugPrint("$e");
//       return false;
//     }
//   }

//   @override
//   Future<RenewedUser?> signinAnonim() async {
//     try {
//       UserCredential authCredential = await _firebaseAuth.signInAnonymously();
//       return _userFromFirebase(authCredential.user);
//     } catch (e) {
//       debugPrint("$e");
//       return null;
//     }
//   }

//   @override
//   Future<RenewedUser?> signInByGoogle() async {
//     try {
//       UserCredential authCredential = await _firebaseAuth.signInAnonymously();
//       return _userFromFirebase(authCredential.user);
//     } catch (e) {
//       debugPrint("$e");
//       return null;
//     }
//   }

//   @override
//   Future<RenewedUser?> signInByEmailPassword(
//       String email, String password) async {
//     return RenewedUser(id: "randomID3987428374", email: "test@test.com");
//   }

//   @override
//   Future<RenewedUser?> createUserByEmailPassword(
//     String email,
//     String? password1,
//     String password2,
//   ) async {
//     return RenewedUser(id: "randomID3987428374", email: "test@test.com");
//   }

//   @override
//   bool? isVerified() {
//     return true;
//   }

//   @override
//   Future<bool> verifyMail() async {
//     return await Future.value(true);
//   }

//   @override
//   bool? isAnonim() {
//     return true;
//   }
// }

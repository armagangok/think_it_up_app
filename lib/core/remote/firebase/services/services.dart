// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../models/user_model.dart';
// import 'auth_base.dart';

// class FirebaseAuthService implements AuthBase {
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
//       return RenewedUser(email: user.email, id: user.uid);
//     }
//   }

//   @override
//   Future<bool> signOut() async {
//     debugPrint("current user state: " "${_firebaseAuth.currentUser}");
//     try {
//       final GoogleSignIn _googleSigniIn = GoogleSignIn();
//       if (_googleSigniIn.currentUser != null) {
//         await _googleSigniIn.signOut();
//       }

//       if (_firebaseAuth.currentUser?.isAnonymous == true) {
//         debugPrint(
//             "anonim user state: ${_firebaseAuth.currentUser?.isAnonymous}");
//         await _firebaseAuth.currentUser?.delete();
//       } else {
//         debugPrint(
//             "anonim user state: ${_firebaseAuth.currentUser?.isAnonymous}");
//       }
//       await _firebaseAuth.signOut();
//       return true;
//     } catch (e) {
//       debugPrint("error in services at signOut: [$e]");
//       return false;
//     }
//   }

//   @override
//   Future<RenewedUser?> signinAnonim() async {
//     try {
//       UserCredential authCredential = await _firebaseAuth.signInAnonymously();
//       return _userFromFirebase(authCredential.user);
//     } catch (e) {
//       debugPrint("Error in Services, at siginAnonim [$e]");
//       return null;
//     }
//   }

//   @override
//   Future<RenewedUser?> signInByGoogle() async {
//     final GoogleSignIn _googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

//     if (_googleUser != null) {
//       final GoogleSignInAuthentication _googleAuth =
//           await _googleUser.authentication;
//       if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
//         UserCredential _credential = await _firebaseAuth
//             .signInWithCredential(GoogleAuthProvider.credential(
//           idToken: _googleAuth.idToken,
//           accessToken: _googleAuth.accessToken,
//         ));
//         final User? _user = _credential.user;
//         return _userFromFirebase(_user);
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<RenewedUser?> createUserByEmailPassword(
//     String email,
//     String password1,
//     String? password2,
//   ) async {
//     try {
//       UserCredential authCredential =
//           await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password1,
//       );
//       return _userFromFirebase(authCredential.user);
//     } catch (e) {
//       debugPrint("Error in services, at createUserWithEmailAndPassword: [$e]");
//       return null;
//     }
//   }

//   @override
//   Future<RenewedUser?> signInByEmailPassword(
//       String email, String password) async {
//     try {
//       debugPrint(
//           "DEBUG in FirebaseAuthService at signInByEmailPassword. \n  S${_firebaseAuth.currentUser?.emailVerified}");
//       UserCredential authCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return _userFromFirebase(authCredential.user);
//     } catch (e) {
//       debugPrint("Error in services, signInWithEmailAndPassword: [$e]");
//       return null;
//     }
//   }

//   @override
//   bool? isVerified() {
//     bool? isVerified = _firebaseAuth.currentUser?.emailVerified;
//     return isVerified;
//   }

//   @override
//   Future<void> verifyMail() async {
//     await _firebaseAuth.currentUser?.sendEmailVerification();
//   }

//   @override
//   bool? isAnonim() {
//     debugPrint("isAnonim: [${_firebaseAuth.currentUser?.isAnonymous}]");
//     return _firebaseAuth.currentUser?.isAnonymous;
//   }
// }

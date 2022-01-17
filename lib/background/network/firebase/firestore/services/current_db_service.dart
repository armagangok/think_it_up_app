import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../auth/models/user_model.dart';
import 'db_base.dart';

class CurrentDbService implements DbBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(RenewedUser user) async {
    try {
      await _firestore.collection("users").doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      debugPrint("$e");
      return false;
    }
  }
}

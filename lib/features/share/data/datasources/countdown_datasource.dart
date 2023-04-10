import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class CountDownDataSource {
  late StreamSubscription<DocumentSnapshot> subscription;
  late DateTime countdownEndTime;

  fetchCountDownTime() {
    subscription = FirebaseFirestore.instance
        .collection('countdown')
        .doc('countdownEndTime')
        .snapshots()
        .listen((documentSnapshot) {});

    // countdownEndTime = documentSnapshot.data()!['endTime'].toDate();
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class CountDownDataSource {
  late StreamSubscription<DocumentSnapshot> subscription;
  late DateTime countdownEndTime;

  fetchCountDownTime() {
    FirebaseFirestore.instance.collection('timers').add(
      {
        'start_time': DateTime.now(),
        'end_time': DateTime.now().add(
          const Duration(
            seconds: 30,
          ),
        ), // replace with your desired timer duration
      },
    );

    subscription = FirebaseFirestore.instance
        .collection('countdown')
        .doc('countdownEndTime')
        .snapshots()
        .listen((documentSnapshot) {
      countdownEndTime = documentSnapshot.data()!['endTime'].toDate();
    });
  }
}

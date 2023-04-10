import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class CountdownTimerWidget extends StatefulWidget {
  const CountdownTimerWidget({Key? key}) : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late StreamSubscription<DocumentSnapshot> subscription;
  late DateTime countdownEndTime;

  @override
  void initState() {
    super.initState();
    subscription = FirebaseFirestore.instance
        .collection('countdown')
        .doc('countdownEndTime')
        .snapshots()
        .listen((documentSnapshot) {
      setState(() {
        countdownEndTime = documentSnapshot.data()!['endTime'].toDate();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: countdownEndTime == null
            ? const CircularProgressIndicator()
            : StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (BuildContext context, snapshot) {
                  Duration remainingTime =
                      countdownEndTime.difference(DateTime.now());
                  return Text(
                      '${remainingTime.inHours}:${remainingTime.inMinutes.remainder(60)}:${remainingTime.inSeconds.remainder(60)}');
                },
              ),
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

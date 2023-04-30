import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:timer_count_down/timer_count_down.dart';

class CountdownTimerWidget extends StatefulWidget {
  const CountdownTimerWidget({Key? key}) : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  @override
  void initState() {
    // FirebaseFirestore.instance.collection('timers').add({
    //   'start_time': DateTime.now(),
    //   'end_time': DateTime.now().add(
    //     const Duration(hours: 24),
    //   ), // replace with your desired timer duration
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('timers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
              var timerDoc = snapshot.data!.docs[0];
              var startTime = timerDoc['start_time'] as Timestamp;
              var endTime = timerDoc['end_time'] as Timestamp;
              return Countdown(
                seconds: 20,
                build: (_, time) {
                  
                  return Text(
                    'Time left: $time',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // subscription.cancel();
    super.dispose();
  }
}

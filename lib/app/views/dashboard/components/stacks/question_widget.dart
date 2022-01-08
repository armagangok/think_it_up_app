import 'package:flutter/material.dart';
import '../../../../core/components/common/alignment/alignment.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding8(
            child: Text(
              "Question Of The Week",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding8(child: Text("What do you think about this app?")),
        ],
      ),
    );
  }
}

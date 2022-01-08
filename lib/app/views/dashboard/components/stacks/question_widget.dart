import 'package:flutter/material.dart';
import '../../../../core/components/common/alignment/alignment.dart';
import '../../../../theme/colors.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: CustomColor().mainColor,
      ),
      width: MediaQuery.of(context).size.longestSide,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomPadding(
            child: Text(
              "Question Of The Week",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomPadding(child: Text("What do you think about this app?")),
        ],
      ),
    );
  }
}

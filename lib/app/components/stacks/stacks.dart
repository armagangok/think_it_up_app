import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/theme/colors.dart';

class QuestionWidget extends StatelessWidget {
  final String? text;

  const QuestionWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: customColor.contColor,
      ),
      width: MediaQuery.of(context).size.longestSide,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Question Of The Week",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text!),
          ),
        ],
      ),
    );
  }
}

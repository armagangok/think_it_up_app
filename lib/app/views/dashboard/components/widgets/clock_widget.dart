import 'package:flutter/material.dart';

import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TimeContainer(text: "22" "h"),
        SizedBox5H(),
        Text24B(text: ":"),
        SizedBox5H(),
        TimeContainer(text: "12" "m"),
      ],
    );
  }
}

class TimeContainer extends StatelessWidget {
  final String text;

  const TimeContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      heigth: 45,
      width: 45,
      color: Colors.grey,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(),
          ),
        ),
      ),
    );
  }
}

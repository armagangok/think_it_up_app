import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/components/widgets/text_widgets.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return Row(
      children: const [
        TimeContainer(text: "22" "h"),
        SizedBox(width: 5),
        Text24B(text: ":"),
        SizedBox(width: 5),
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
    log(context.widget.runtimeType.toString() + "build run");
    return Text24B(text: text);
  }
}

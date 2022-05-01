import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/components/common/widgets/text_widgets.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Text24B(text: text);
  }
}

import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TimeContainer(),
        SizedBox5H(),
        Text24B(text: ":"),
        SizedBox5H(),
        TimeContainer(),
      ],
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({Key? key}) : super(key: key);

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
          child: const Text(
            "22",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}

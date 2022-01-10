import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/views/dashboard/components/widgets/clock_widget.dart';
import '../../../../core/components/common/alignment/alignment.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding8(
                child: Text24B(text: "Question Of The Week"),
              ),
              Padding8(
                child: Text16(text: "What do you think about this app?"),
              ),
            ],
          ),
          const TimeWidget(),
        ],
      ),
    );
  }
}

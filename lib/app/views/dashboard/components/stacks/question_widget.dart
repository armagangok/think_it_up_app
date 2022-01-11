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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SymmetricPadding(
                horizontal: 5,
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text24B(text: "Question Of The Week"),
                    ),
                    Text16(
                      text:
                          "How on the earth Einstein succed? where me you could be x axis flutter github? firebase linkedin books math",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text16(text: "Deadline"),
              TimeWidget(),
            ],
          )
        ],
      ),
    );
  }
}

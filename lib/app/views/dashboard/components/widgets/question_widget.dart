import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/icons.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/app/views/dashboard/components/widgets/clock_widget.dart';

import 'bottom_sheet.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding8(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AutoText(text: header),
                    ),
                    SizedBox5H(),
                    AutoSizeText(question, maxLines: 3, minFontSize: 13),
                  ],
                ),
              ),
            ),
          ),
          // Padding5(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: const [
          //           TimeWidget(),
          //           SizedBox10H(),
          //           Text13(text: "Deadline"),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SharePostView extends StatelessWidget {
  const SharePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      body: Column(),
      topBar: AppBar(),
    );
  }
}

const String question =
    "How on the earth Einstein succed? where me you mememememememememememememememememememecould be x axis flutter github? firebase linkedin books mathgithubmathgithubmathgithubmathgithubmathgithub?";

const String header = "Question Of The Week";

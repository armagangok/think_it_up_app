import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';
import 'components/stacks/question_widget.dart';
import 'components/stacks/comment_widget.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPadding(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: QuestionWidget(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  SizedBox20H(),
                  CommentWidget(),
                  SizedBox20H(),
                  CommentWidget(),
                  SizedBox20H(),
                  CommentWidget(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox10H(),
              CustomElevatedButton(
                buttonWidth: MediaQuery.of(context).size.longestSide,
                buttonHeigth: 25,
                radius: 5,
                text: "Leave a comment",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

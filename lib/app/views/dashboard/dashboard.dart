import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/views/dashboard/components/stacks/bottom_nav_bar.dart';
import 'components/stacks/comment_widget.dart';
import 'components/stacks/question_widget.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBar: const QuestionWidget(),
      body: Column(
        children: const [
          SizedBox20H(),
          CommentWidget(),
          SizedBox20H(),
          CommentWidget(),
          SizedBox20H(),
          CommentWidget(),
        ],
      ),
      bottomBar: const BottomNavBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/components/common/widgets/padding.dart';
import 'package:think_it_up_app/app/components/stacks/stacks.dart';

import 'components/stacks/stacks.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPadding(
        child: Scaffold(
          body: Column(
            children: const <Widget>[
              QuestionWidget(),
              SizedBox(height: 20),
              CommentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

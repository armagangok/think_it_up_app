import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/components/alignment/alignment.dart';
import '../screen_dashboard/components/question_widget.dart';
import 'components/post_sharing_widget.dart';

class SharePostScreen extends StatelessWidget {
  const SharePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return Wrapper(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            QuestionWidget(),
            PostSharingWidget(),
          ],
        ),
      ),
    );
  }
}

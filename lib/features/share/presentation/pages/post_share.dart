import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../../../dashboard/presentation/widgets/question_widget.dart';
import '../widgets/post_sharing_widget.dart';



class SharePostPage extends StatelessWidget {
  const SharePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

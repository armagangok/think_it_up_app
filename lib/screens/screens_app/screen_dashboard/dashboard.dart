import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/core/extensions/context_extension.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/models/post_model.dart';
import 'package:think_it_up_app/global/network/firebase/firestore/viewmodels/db_viewmodel.dart';
import 'components/widgets/comment_widget.dart';
import 'components/widgets/question_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DbViewModel _posts = Provider.of<DbViewModel>(context);

    return FutureBuilder<List<PostModel>>(
      future: _posts.getPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        late final List<PostModel> posts = snapshot.data;
        if (snapshot.hasData) {
          return Wrapper(
            topBarHeight: context.longestSide(0.235),
            topBar: const QuestionWidget(),
            body: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CommentWidget(post: posts[index]),
                    const SizedBox002(),
                  ],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("There is a problem."));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class SizedBox002 extends StatelessWidget {
  const SizedBox002({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.getHeight(0.02));
  }
}

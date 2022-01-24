import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/viewmodels/db_viewmodel.dart';
import './components/export/export.dart';
import '../../../background/core/extensions/context_extension.dart';


class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    DbViewModel _posts = Provider.of<DbViewModel>(context, listen: false);

    return FutureBuilder<List<PostModel>> (
      future: _posts.getPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        late final List<PostModel> post = snapshot.data;

        if (snapshot.hasData) {
          return Wrapper(
            topBarHeight: context.longestSide(0.235),
            topBar: const QuestionWidget(),
            body: ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CommentWidget(post: post[index]),
                    const SizedBox002(),
                  ],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("There is a problem."),
          );
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

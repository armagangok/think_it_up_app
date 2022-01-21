import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/viewmodels/db_viewmodel.dart';

import './components/export/export.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PostModel> _posts = Provider.of<List<PostModel>>(context);
    return Wrapper(
      topBar: const QuestionWidget(),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: CommentWidget(post: _posts[index]),
          );
        },
      ),
    );
  }
}

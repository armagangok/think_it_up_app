import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './components/comment_widget.dart';
import './components/question_widget.dart';
import './networking/viewmodels/dashboard_viewmodel.dart';
import './networking/viewmodels/firebase_viewmodel.dart';
import '../../../core/components/alignment/alignment.dart';
import '../../../core/extensions/context_extension.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    FirebaseViewmodel().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DashVievmodel _dashViewModel = Provider.of<DashVievmodel>(context);
    final FirebaseViewmodel _firebase = Provider.of<FirebaseViewmodel>(context);

    return Wrapper(
      topBarHeight: context.longestSide(0.235),
      topBar: const QuestionWidget(),
      body: ListView.builder(
        itemCount: _firebase.posts.length,
        itemBuilder: (context, index) {
          _dashViewModel.changeIndexOfComment(index);
          return ListTile(
            key: Key("$index"),
            title: Column(
              children: [
                const SizedBox002(),
                CommentWidget(post: _firebase.posts[index]),
                const SizedBox002(),
              ],
            ),
          );
        },
      ),
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




// FutureBuilder<List<PostModel>>(
//       future: _posts.getPosts(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         late final List<PostModel> posts = snapshot.data;

//         if (snapshot.hasData) {
//           return Wrapper(
//             topBarHeight: context.longestSide(0.235),
//             topBar: const QuestionWidget(),
//             body: ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     CommentWidget(post: posts[index]),
//                     const SizedBox002(),
//                   ],
//                 );
//               },
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return const Center(child: Text("There is a problem."));
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
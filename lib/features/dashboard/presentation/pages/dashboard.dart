import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../../../../injection/injection_container.dart';
import '../../data/view-models/firestore_viewmodel.dart';
import '../widgets/comment_widget.dart';
import '../widgets/question_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    final _firestore = getit.get<FirestoreVModel>();
    return Wrapper(
      topBarHeight: context.width(0.235),
      topBar: const QuestionWidget(),
      body: FutureBuilder(
          future: FirestoreVModel().getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _firestore.posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommentWidget(
                        setstate: () {
                          setState(() {});
                        },
                        post: _firestore.posts[index]),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class SizedBox002 extends StatelessWidget {
  const SizedBox002({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return SizedBox(height: context.height(0.02));
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
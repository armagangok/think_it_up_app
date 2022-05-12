import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './components/comment_widget.dart';
import './components/question_widget.dart';
import './networking/view-models/firestore_viewmodel.dart';
import '../../../core/components/alignment/alignment.dart';
import '../../../core/extensions/context_extension.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    final GlobalViewModel _firestore = Provider.of<GlobalViewModel>(context);
    return Wrapper(
      topBarHeight: context.longestSide(0.235),
      topBar: const QuestionWidget(),
      body: FutureBuilder(
          future: GlobalViewModel().getPosts(),
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
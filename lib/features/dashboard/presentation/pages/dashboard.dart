import 'package:flutter/material.dart';
import 'package:think_it_up_app/features/dashboard/data/models/post_model.dart';
import 'package:think_it_up_app/features/dashboard/data/services/base_database_service.dart';

import '../../../../core/export/core_export.dart';
import '../../../../injection/injection_container.dart';
import '../../data/view-models/firestore_viewmodel.dart';
import '../widgets/comment_widget.dart';
import '../widgets/question_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final _firestore = getit.get<BaseDataService>();
  List<PostModel> postList = [];
  @override
  void initState() {
    _firestore.getPosts().then((value) => postList = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBarHeight: context.width(0.235),
      topBar: const QuestionWidget(),
      body: FutureBuilder(
          future: FirestoreVModel().getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommentWidget(
                      setstate: () {
                        setState(() {});
                      },
                      post: postList[index],
                    ),
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
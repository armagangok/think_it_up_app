import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/core/extensions/context_extension.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/viewmodels/dashboard_viewmodel.dart';
import 'components/widgets/comment_widget.dart';
import 'components/widgets/question_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    DashVievModel().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DashVievModel _dashViewModel =
        Provider.of<DashVievModel>(context);
    return Wrapper(
      topBarHeight: context.longestSide(0.235),
      topBar: const QuestionWidget(),
      body: ListView.builder(
        itemCount: _dashViewModel.posts.length,
        itemBuilder: (context, index) {
          _dashViewModel.changeIndexOfComment(index);
          return ListTile(
            key: Key("$index"),
            title: Column(
              children: [
                const SizedBox002(),
                CommentWidget(post: _dashViewModel.posts[index]),
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
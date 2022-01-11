import './components/export/export.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBar: const QuestionWidget(),
      body: Column(
        children: const [
          SizedBox20H(),
          CommentWidget(),
          SizedBox20H(),
          CommentWidget(),
          SizedBox20H(),
          CommentWidget(),
        ],
      ),
    );
  }
}

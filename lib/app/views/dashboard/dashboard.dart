import './components/export/export.dart';
import 'components/stacks/bottom_nav_bar.dart';

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
      // bottomBar: const BottomNavBar(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:think_it_up_app/features/dashboard/presentation/viewmodels/dashboard_viewmodel.dart';

import '../../../../core/export/core_export.dart';

import '../widgets/comment_widget.dart';
import '../widgets/question_widget.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBarHeight: context.width(0.235),
      topBar: const QuestionWidget(),
      body: ref.watch(dashboardViewModel).postState.when(
        initial: () {
          return const Text("initial");
        },
        loading: () {
          return const Center(child: CupertinoActivityIndicator());
        },
        completed: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommentWidget(
                  setstate: () {
                    setState(() {});
                  },
                  post: data[index],
                ),
              );
            },
          );
        },
        failed: (failure) {
          return Text(failure.message);
        },
      ),
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

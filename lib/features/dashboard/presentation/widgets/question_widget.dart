import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/export/core_export.dart';

class QuestionWidget extends ConsumerWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(dashboardViewModel).fetchQuestionState.when(
      initial: () {
        return const Center();
      },
      loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
      completed: (data) {
        return QuestionTextStack(data: data);
      },
      failed: (failure) {
        return Text(failure.message);
      },
    );
  }
}

class QuestionTextStack extends StatelessWidget {
  final String data;
  const QuestionTextStack({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PaddingAll10(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AutoText(text: header),
                    const SizedBox5H(),
                    AutoSizeText(
                      data,
                      maxLines: 3,
                      minFontSize: 13,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String header = "Question Of The Week";

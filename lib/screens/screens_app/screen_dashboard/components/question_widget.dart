import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/text_widgets.dart';
import '../networking/services/question_service.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    final QuestionService _question = Provider.of<QuestionService>(context);
    return FutureBuilder(
      future: _question.getQuestion(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Q(data: snapshot.data);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("ERROR"),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class Q extends StatelessWidget {
  final String data;
  const Q({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding8(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AutoText(text: header),
                    const SizedBox5H(),
                    AutoSizeText(
                      data,
                      maxLines: 3,
                      minFontSize: 13,
                      textAlign: TextAlign.left,
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

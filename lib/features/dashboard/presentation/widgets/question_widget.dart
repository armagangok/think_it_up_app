import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:think_it_up_app/injection/injection_container.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/text_widgets.dart';
import '../../data/view-models/firestore_viewmodel.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FirestoreVModel _firestore = getit.get<FirestoreVModel>();
    return FutureBuilder(
      future: _firestore.getQuestion(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return QuestionTextStack(data: snapshot.data);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  final String text;
  const DialogMessage({
    Key? key,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Column(
        children: [
          Text(text),
        ],
      ),
    );
  }
}

void dialog(context, text) {
  showDialog(
    context: context,
    builder: (_) => DialogMessage(text: text),
  );
}

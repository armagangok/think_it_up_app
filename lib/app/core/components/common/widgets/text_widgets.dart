import 'package:flutter/material.dart';

class Text24B extends StatelessWidget {
  final String text;

  const Text24B({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Monaco",
      ),
    );
  }
}

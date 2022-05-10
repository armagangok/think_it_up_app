import 'package:auto_size_text/auto_size_text.dart';
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
      style: Theme.of(context).textTheme.caption,
    );
  }
}

class AutoText extends StatelessWidget {
  final String text;

  const AutoText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 1,
      maxFontSize: 24,
      minFontSize: 20,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class Text13 extends StatelessWidget {
  final String text;

  const Text13({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

class Text16 extends StatelessWidget {
  final String text;

  const Text16({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
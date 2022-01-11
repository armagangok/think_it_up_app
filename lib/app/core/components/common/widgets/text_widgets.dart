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

class Text36B extends StatelessWidget {
  final String text;

  const Text36B({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1,
      
    );
  }
}

class Text14 extends StatelessWidget {
  final String text;

  const Text14({
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

import 'package:flutter/material.dart';

import '../../../core/export/core_export.dart';

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
      style: context.bodySmall,
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
      style: context.bodyMedium,
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
      style: context.bodyMedium,
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
      style: context.bodyMedium,
    );
  }
}

import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Text(verification),
    );
  }
}

const String verification =
    "Hello! Verification link sent your e-mail. Please verify your account.";

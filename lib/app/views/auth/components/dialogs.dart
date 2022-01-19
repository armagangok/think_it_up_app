import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/views/auth/login/login.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor().bgColor,
      child: CupertinoAlertDialog(
        title: Column(
          children: const [
            Text(verification1),
            Text(verification2),
            Text(verification3),
          ],
        ),
        actions: [
          CustomElevatedButton(
            text: "OK",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            ),
          ),
        ],
      ),
    );
  }
}

const String verification1 = "\nHello There!\n";
const String verification2 = "Verification link has been sent your e-mail.\n";
const String verification3 =
    "Do you really think that you can signin without verification? \n";

void dialog(context) {
  showDialog(
    context: context,
    builder: (_) => const DialogMessage(),
  );
}

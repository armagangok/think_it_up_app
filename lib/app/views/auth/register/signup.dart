import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/core/components/stacks/stacks.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.black,
          ),
          preferredSize: const Size.fromHeight(70)),
      child: Column(
        children: [
          const Text36B(text: "Think It Up"),
          const SizedBox20H(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text14(text: "mail"),
              CustomTextField(
                boolean: false,
                maxLines: 1,
                valueCatcher: () {},
              ),
              const SizedBox20H(),
              const Text14(text: "password"),
              CustomTextField(
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("hello!!!!!"),
                  icon: const Icon(CupertinoIcons.eye),
                ),
                maxLines: 1,
                valueCatcher: () => print("value"),
              ),
              const SizedBox20H(),
              const Text14(text: "password"),
              CustomTextField(
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("hello!!!!!"),
                  icon: const Icon(CupertinoIcons.eye),
                ),
                maxLines: 1,
                valueCatcher: () => print("value"),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Signup",
                onPressed: () => print("signup button"),
              ),
              const SizedBox20H(),
            ],
          ),
        ],
      ),
    );
  }
}

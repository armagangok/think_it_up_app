import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/core/components/stacks/stacks.dart';
import 'package:think_it_up_app/app/views/auth/register/signup.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
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
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Login",
                onPressed: () => print("login button"),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupView()),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text16(text: "New to  "),
                    Text("Think It Up ?  ",
                        style: Theme.of(context).textTheme.headline3),
                    Text("SignUp",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/core/components/stacks/stacks.dart';
import 'package:think_it_up_app/app/core/components/widgets_text_controller.dart';
import 'package:think_it_up_app/app/views/auth/components/dialogs.dart';
import 'package:think_it_up_app/app/views/auth/register/signup.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/background/network/firebase/auth/viewmodels/user_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel _userViewModel = Provider.of<UserViewModel>(context);

    return AuthWrapper(
      child: Column(
        children: [
          const AutoText(text: "Think It Up"),
          const SizedBox20H(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text13(text: "mail"),
              CustomTextField(
                initialValue: "1armagangok@gmail.com",
                controller: textControllers.emailLogin,
                boolean: false,
                maxLines: 1,
              ),
              const SizedBox20H(),
              const Text13(text: "password"),
              CustomTextField(
                initialValue: "19033412",
                controller: textControllers.passwordLogin,
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {},
                  icon: const Icon(CupertinoIcons.eye),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Login",
                onPressed: () async {
                  var a = await _userViewModel.signInByEmailPassword(
                    textControllers.emailLogin.text,
                    textControllers.passwordLogin.text,
                  );
                },
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

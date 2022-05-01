import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/core/components/common/widgets/buttons.dart';
import 'package:think_it_up_app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/core/components/stacks/stacks.dart';
import 'package:think_it_up_app/core/components/widgets_text_controller.dart';
import 'package:think_it_up_app/global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'package:think_it_up_app/screens/screens_auth/components/text_form_field.dart';
import 'package:think_it_up_app/screens/screens_auth/screen_register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              AuthTextField(
                controller: textControllers.emailLogin,
                boolean: false,
              ),
              const SizedBox20H(),
              const Text13(text: "password"),
              AuthTextField(
                controller: textControllers.passwordLogin,
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {},
                  icon: const Icon(CupertinoIcons.eye),
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Login",
                onPressed: () async {
                  await _userViewModel.signInByEmailPassword(
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

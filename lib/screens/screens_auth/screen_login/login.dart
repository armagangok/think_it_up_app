import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/alignment/alignment.dart';
import '../../../core/components/stacks/stacks.dart';
import '../../../core/components/widgets/buttons.dart';
import '../../../core/components/widgets/text_widgets.dart';
import '../../../core/networking/firebase/view-models/firebase_viewmodel.dart';
import '../components/text_form_field.dart';
import '../screen_register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailLogin =
        TextEditingController(text: "1armagangok@gmail.com");
    final TextEditingController _passwordLogin =
        TextEditingController(text: "1234567");

    final FirebaseViewmodel _userViewModel = Provider.of<FirebaseViewmodel>(context);

    return AuthWrapper(
      child: Column(
        children: [
          const AutoText(text: "Think It Up"),
          const SizedBox20H(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text13(text: "mail"),
              AuthTextField(controller: _emailLogin),
              const SizedBox20H(),
              const Text13(text: "password"),
              AuthTextField(controller: _passwordLogin, isObscure: true),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Login",
                onPressed: () async {
                  await _userViewModel.signInByEmailPassword(
                    _emailLogin.text,
                    _passwordLogin.text,
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/alignment/alignment.dart';
import '../../../core/components/stacks/stacks.dart';
import '../../../core/components/widgets/buttons.dart';
import '../../../core/components/widgets/text_widgets.dart';
import '../../../global/constants/constants.dart';
import '../../../global/network/firebase/auth/models/user_model.dart';
import '../../../global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import '../components/dialogs.dart';
import '../components/text_form_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    final FirebaseModel _userViewModel = Provider.of<FirebaseModel>(context);
    final TextEditingController _username = TextEditingController();
    final TextEditingController _email =
        TextEditingController(text: "1armagangok@gmail.com");
    final TextEditingController _password1 =
        TextEditingController(text: "1234567");
    final TextEditingController _password2 =
        TextEditingController(text: "1234567");

    return AuthWrapper(
      appBar: PreferredSize(
        child: AppBar(backgroundColor: Colors.black),
        preferredSize: const Size.fromHeight(70),
      ),
      child: Column(
        children: [
          const AutoText(text: "Think It Up"),
          const SizedBox20H(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text13(text: "username"),
              AuthTextField(controller: _username),
              const SizedBox20H(),
              const Text13(text: "mail"),
              AuthTextField(controller: _email),
              const SizedBox20H(),
              const Text13(text: "password"),
              AuthTextField(controller: _password1, isObscure: true),
              const SizedBox20H(),
              const Text13(text: "password"),
              AuthTextField(controller: _password2, isObscure: true),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Signup",
                onPressed: () async {
                  AppUser user = AppUser(
                    id: "id",
                    email: _email.text,
                    userName: _username.text,
                    password: _password1.text,
                  );

                  AppUser? response =
                      await _userViewModel.createUserByEmailPassword(user);

                  print("response => $response");

                  response == null
                      ? dialog(context, ConstText().error)
                      : dialog(context, ConstText().verification);
                },
              ),
              const SizedBox20H(),
            ],
          ),
        ],
      ),
    );
  }
}

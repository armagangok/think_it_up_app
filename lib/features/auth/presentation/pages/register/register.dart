import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/export/core_export.dart';
import '../../widgets/dialogs.dart';
import '../../widgets/text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // final AuthViewModel _userViewModel = Provider.of<AuthViewModel>(context);
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
                    likedPostsIDS: [],
                  );

                  try {
                    // AppUser? response =
                    //     await _userViewModel.createUserByEmailPassword(user);

                    // response == null
                    //     ? dialog(context, ConstText().error)
                    //     : dialog(context, ConstText().verification);
                  } catch (e) {
                    dialog(context, "$e");
                  }
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/common/alignment/alignment.dart';
import '../../../core/components/common/widgets/buttons.dart';
import '../../../core/components/common/widgets/text_widgets.dart';
import '../../../core/components/stacks/stacks.dart';
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
    final UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    final TextEditingController _usernameRegister = TextEditingController();
    final TextEditingController _emailRegister = TextEditingController();
    final TextEditingController _passwordRegister1 = TextEditingController();
    final TextEditingController _passwordRegister2 = TextEditingController();

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
              const Text13(text: "mail"),
              AuthTextField(
                boolean: false,
                controller: _emailRegister,
              ),
              const SizedBox20H(),
              const Text13(text: "password"),
              AuthTextField(
                controller: _passwordRegister1,
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.eye),
                ),
              ),
              const SizedBox20H(),
              const Text13(text: "password"),
              AuthTextField(
                controller: _passwordRegister2,
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.eye),
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Signup",
                onPressed: () async {
                  dialog(context, "greeting");

                  AppUser user = AppUser(
                    id: "id",
                    email: _emailRegister.text,
                    userName: _usernameRegister.text,
                    password1: _passwordRegister1.text,
                    
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

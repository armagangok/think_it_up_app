import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/core/components/stacks/stacks.dart';
import 'package:think_it_up_app/app/core/components/widgets_text_controller.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/background/network/firebase/auth/viewmodels/user_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel _userViewModel = Provider.of<UserViewModel>(context);

    return AuthWrapper(
      appBar: PreferredSize(
        child: AppBar(backgroundColor: Colors.black),
        preferredSize: const Size.fromHeight(70),
      ),
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
                controller: textControllers.emailRegister,
              ),
              const SizedBox20H(),
              const Text14(text: "password"),
              CustomTextField(
                controller: textControllers.passwordRegister1,
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.eye),
                ),
                maxLines: 1,
              ),
              const SizedBox20H(),
              const Text14(text: "password"),
              CustomTextField(
                controller: textControllers.passwordRegister2,
                boolean: true,
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.eye),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Signup",
                onPressed: () async =>
                    await _userViewModel.createUserByEmailPassword(
                  textControllers.emailRegister.text,
                  textControllers.passwordRegister1.text,
                  textControllers.passwordRegister2.text,
                ),
              ),
              const SizedBox20H(),
            ],
          ),
        ],
      ),
    );
  }
}

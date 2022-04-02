import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/core/components/common/widgets/buttons.dart';
import 'package:think_it_up_app/core/components/common/widgets/text_fields.dart';
import 'package:think_it_up_app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/core/components/stacks/stacks.dart';
import 'package:think_it_up_app/core/components/widgets_text_controller.dart';
import 'package:think_it_up_app/global/constants/constants.dart';
import 'package:think_it_up_app/global/network/firebase/auth/models/user_model.dart';
import 'package:think_it_up_app/global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'package:think_it_up_app/screens/screens_auth/components/dialogs.dart';

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
          const AutoText(text: "Think It Up"),
          const SizedBox20H(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text13(text: "mail"),
              CustomTextField(
                boolean: false,
                maxLines: 1,
                controller: textControllers.emailRegister,
              ),
              const SizedBox20H(),
              const Text13(text: "password"),
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
              const Text13(text: "password"),
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
                onPressed: () async {
                  // dialog(context, greeting);

                  RenewedUser? response =
                      await _userViewModel.createUserByEmailPassword(
                    textControllers.emailRegister.text,
                    textControllers.passwordRegister1.text,
                    textControllers.passwordRegister2.text,
                  );

                  print("response => $response");

                  response == null
                      ? dialog(context, ConstText().error)
                      : dialog(context, ConstText().verification) ;
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

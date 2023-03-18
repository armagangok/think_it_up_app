import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/export/core_export.dart';
import '../../widgets/text_form_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _username = TextEditingController();
  final _email = TextEditingController(text: "1armagangok@gmail.com");
  final _password1 = TextEditingController(text: "1234567");
  final _password2 = TextEditingController(text: "1234567");
  @override
  Widget build(BuildContext context) {
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
                isLoading: ref.watch(authViewModel).registerState ==
                        const StateResult.loading()
                    ? true
                    : false,
                text: "Signup",
                onPressed: () async {
                  AppUser user = AppUser(
                    id: "id",
                    email: _email.text,
                    userName: _username.text,
                    password: _password1.text,
                    passwordRepeat: _password2.text,
                    likedPostsIDS: [],
                  );

                  await ref.read(authViewModel).register(userModel: user);

                  ref.watch(authViewModel).registerState.when(
                        initial: () {},
                        loading: () {},
                        completed: (data) {
                          context.showSnackBar(
                            SnackBar(
                              content: Text("$data"),
                            ),
                          );
                        },
                        failed: (failure) {
                          context.showSnackBar(
                            SnackBar(
                              content: Text(failure.message),
                            ),
                          );
                        },
                      );
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

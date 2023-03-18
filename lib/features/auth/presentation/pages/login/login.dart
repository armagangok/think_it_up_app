import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:think_it_up_app/core/export/core_export.dart';
import 'package:think_it_up_app/injection/injection_container.dart';

import '../../viewmodel/auth_viewmodel.dart';
import '../../widgets/text_form_field.dart';
import '../register/register.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailLogin = TextEditingController(text: "1armagangok@gmail.com");
  final _passwordLogin = TextEditingController(text: "1234567");

  final AuthViewModel _userViewModel = getit.get<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
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
              _loginButton(_emailLogin, _passwordLogin, _userViewModel),
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
                        style: Theme.of(context).textTheme.displaySmall),
                    Text("SignUp",
                        style: Theme.of(context).textTheme.displayMedium),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loginButton(TextEditingController _emailLogin,
      TextEditingController _passwordLogin, AuthViewModel _userViewModel) {
    return CustomElevatedButton(
      text: "Login",
      onPressed: () async {
        var _userModel = UserLoginModel(
          email: _emailLogin.text,
          password: _passwordLogin.text,
        );
        await _userViewModel.login(userModel: _userModel);
      },
    );
  }
}

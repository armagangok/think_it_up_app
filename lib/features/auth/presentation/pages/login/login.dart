import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/export/core_export.dart';
import '../../widgets/text_form_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailLogin = TextEditingController(text: "1armagangok@gmail.com");
  final _passwordController = TextEditingController(text: "1234567");

  final AuthViewModel _userViewModel = getit.get<AuthViewModel>();

  @override
  void dispose() {
    _emailLogin.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      child: Column(
        children: [
          const AutoText(text: "Think It Up"),
          const SizedBox20H(),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text13(text: "mail"),
                _emailTextField(),
                const SizedBox20H(),
                const Text13(text: "password"),
                _passwordTextField(),
                const SizedBox(height: 40),
                _loginButton(),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text16(text: "New to  "),
                      Text(
                        "Think It Up ?  ",
                        style: context.bodyMedium.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CustomBlinkingButton(isExpanded: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AuthTextField _passwordTextField() {
    return AuthTextField(
      controller: _passwordController,
      isObscure: true,
      validator: (val) {
        var hasSpecialCharacter =
            RegexHelper.shared.hasSpecialCharacter(email: val ?? "");
        if (val!.isEmpty) {
          return "Please enter password.";
        } else {
          if (val.length < 7) {
            return "Please enter more than 7 characters.";
          } else {
            if (hasSpecialCharacter) {
              return null;
            } else {
              return "You can't use special characters.";
            }
          }
        }
      },
    );
  }

  AuthTextField _emailTextField() {
    return AuthTextField(
      controller: _emailLogin,
      validator: (val) {
        var isCorrectEmail = RegexHelper.shared.isCorrectEmail(
          email: val ?? "",
        );

        if (!isCorrectEmail) {
          return "Invalid e-mail adress.";
        } else {
          return null;
        }
      },
    );
  }

  Widget _loginButton() {
    return CustomElevatedButton(
      isLoading:
          ref.watch(authViewModel).loginState == const StateResult.loading()
              ? true
              : false,
      text: "Login",
      onPressed: () async {
        var isValidatedInputs = _validateInputs();

        if (isValidatedInputs) {
          var _userModel = UserLoginModel(
            email: _emailLogin.text,
            password: _passwordController.text,
          );
          await _userViewModel.login(userModel: _userModel);
          ref.watch(authViewModel).loginState.when(
                initial: () {},
                loading: () {},
                completed: (data) {
                  context.showSnackBar(
                    const SnackBar(
                      content: Text("Login successful"),
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
        }
      },
    );
  }

  bool _validateInputs() {
    if (_formKey.currentState!.validate()) {
//    If all data are correct then save data to out variables
      // _formKey.currentState!.save();
      return true;
    } else {
//    If all data are not valid then start auto validation.
      // setState(() {
      //   // _autoValidate = true;
      // });
      return false;
    }
  }
}

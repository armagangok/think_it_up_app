import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding8(
        child: Column(
          children: [
            const Text("Think It Up"),
            // const CustomTextField(),
            CustomElevatedButton(
              onPressed: () {},
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

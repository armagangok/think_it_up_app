import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens_app/screen_home/home.dart';
import './screens_auth/screen_login/login.dart';
import '../global/network/firebase/auth/viewmodels/user_viewmodel.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel _userModel = Provider.of<UserViewModel>(context);

    if (_userModel.state == ViewState.idle) {
      if (_userModel.user != null && _userModel.isVerified() == true) {
        return const HomeScreen();
      } else {
        return const LoginScreen();
      }
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}

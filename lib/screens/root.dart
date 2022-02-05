import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'screens_app/screen_home/home.dart';
import 'screens_auth/screen_login/login.dart';


class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const HomeView();

    final UserViewModel _userModel = Provider.of<UserViewModel>(context);

    if (_userModel.state == ViewState.idle) {
      if (_userModel.user != null && _userModel.isVerified() == true) {
        debugPrint("${_userModel.user!.id}");
        debugPrint("${_userModel.isAnonim()}");
        debugPrint("${_userModel.isVerified()}");
        return const HomeScreen();
      } else {
        debugPrint("Error occured, I'm in rootview currently.");
        return const LoginScreen();
      }
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}

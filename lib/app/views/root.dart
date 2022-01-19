import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/background/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'auth/login/login.dart';
import 'home/homeview.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel _userModel = Provider.of<UserViewModel>(context);

    if (_userModel.state == ViewState.idle) {
      if (_userModel.user != null && _userModel.isVerified() == true) {
        debugPrint("${_userModel.user!.id}");
        debugPrint("${_userModel.isAnonim()}");
        debugPrint("${_userModel.isVerified()}");
        return const HomeView();
      } else {
        debugPrint("Error occured, I'm in rootview currently.");
        return const LoginView();
      }
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}

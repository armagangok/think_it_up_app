import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens_app/screen_home/home.dart';
import './screens_auth/screen_login/login.dart';
import '../core/networking/firebase/view-models/firebase_viewmodel.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseViewmodel _userModel = Provider.of<FirebaseViewmodel>(context);

    if (_userModel.state == ViewState.idle) {
      if (_userModel.user != null ) {
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

// && _userModel.isVerified() == true

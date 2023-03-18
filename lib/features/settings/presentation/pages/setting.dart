import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:think_it_up_app/injection/injection_container.dart';

import '../../../../core/components/alignment/alignment.dart';

import '../../../../global/local/view-models/notification_provider.dart';
import '../../../../global/local/view-models/theme_provider.dart';

import '../../../auth/presentation/viewmodel/auth_viewmodel.dart';
import '../../../winners/presentation/widgets/top_bar.dart';
import '../widgets/stacks.dart';
import '../widgets/switch_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    final _authViewModel = getit.get<AuthViewModel>();

    return Wrapper(
      topBar: const TopBar(text: "Settings"),
      body: SizedBox(
        height: MediaQuery.of(context).size.longestSide,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingItem(
                text: 'Edit profile',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Change password',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Push notification',
                onPressed: () {},
                icon: SwitchWidget(
                  switchProvider: NotificationProvider(),
                ),
              ),
              SettingItem(
                text: 'Dark mode',
                onPressed: () {},
                icon: SwitchWidget(
                  switchProvider: ThemeProvider(),
                ),
              ),
              SettingItem(
                text: 'Get premium',
                onPressed: () {},
              ),
              const Divider(),
              const Padding5(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("More"),
                ),
              ),
              SettingItem(
                text: 'About us',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Privacy & Policy',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Terms & Co',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Logout',
                onPressed: () async => await _authViewModel.signout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

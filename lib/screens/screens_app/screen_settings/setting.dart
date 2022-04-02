import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/global/local/viewmodels/notification_provider.dart';
import 'package:think_it_up_app/global/local/viewmodels/theme_provider.dart';
import 'package:think_it_up_app/global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'package:think_it_up_app/screens/screens_app/screen_winners/components/stacks/top_bar.dart';
import 'components/stacks/stacks.dart';
import 'components/widgets/switch_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel _userModel = Provider.of<UserViewModel>(context);

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
                  switchProvider: Provider.of<NotificationProvider>(context),
                ),
              ),
              SettingItem(
                text: 'Dark mode',
                onPressed: () {},
                icon: SwitchWidget(
                  switchProvider: Provider.of<ThemeProvider>(context),
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
                onPressed: () async => await _userModel.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/app/views/winners/components/stacks/top_bar.dart';

import 'components/stacks/stacks.dart';
import 'components/widgets/switch_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBar: const TopBar(text: "Settings"),
      body: SizedBox(
        height: MediaQuery.of(context).size.longestSide - 180,
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
                val: true,
              ),
            ),
            SettingItem(
              text: 'Dark mode',
              onPressed: () {},
              icon: SwitchWidget(
                val: false,
              ),
            ),
            SettingItem(
              text: 'Get premium',
              onPressed: () {},
            ),
            const Divider(),
            const Padding5(
              child:
                  Align(alignment: Alignment.centerLeft, child: Text("More")),
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/views/winners/components/stacks/top_bar.dart';

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
            ),
            SettingItem(
              text: 'Dark mode',
              onPressed: () {},
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

class SettingItem extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function onPressed;

  const SettingItem({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding5(
        child: CustomContainer(
          heigth: 40,
          child: SymmetricPaddingH5(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                icon ?? const Icon(Icons.arrow_forward_ios_rounded, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

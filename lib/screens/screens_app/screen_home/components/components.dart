import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/icons.dart';
import '../../screen_dashboard/dashboard.dart';
import '../../screen_post_sharing/post_share.dart';
import '../../screen_settings/setting.dart';
import '../../screen_winners/winners.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        CustomIcon(icon: CupertinoIcons.star),
        CustomIcon(icon: CupertinoIcons.chat_bubble),
        CustomIcon(icon: CupertinoIcons.home),
        CustomIcon(icon: CupertinoIcons.settings),
      ],
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        WinnerScreen(),
        SharePostScreen(),
        DashBoardScreen(),
        SettingScreen(),
      ],
    );
  }
}

class BottomNavyBar extends StatelessWidget {
  const BottomNavyBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: Container(
        height: 50,
        color: Colors.black,
        child: const TabWidget(),
      ),
    );
  }
}
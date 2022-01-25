import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/components/common/widgets/icons.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/dashboard.dart';
import 'package:think_it_up_app/screens/screens_app/screen_post_sharing/post_share.dart';
import 'package:think_it_up_app/screens/screens_app/screen_settings/setting_screen.dart';
import 'package:think_it_up_app/screens/screens_app/screen_winners/winner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            height: 50,
            color: Colors.black,
            child: const TabBar(
              tabs: [
                CustomIcon(icon: CupertinoIcons.star),
                CustomIcon(icon: CupertinoIcons.chat_bubble),
                CustomIcon(icon: CupertinoIcons.home),
                CustomIcon(icon: CupertinoIcons.settings),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            WinnerScreen(),
            SharePostScreen(),
            DashBoardScreen(),
            SettingScreen(),
          ],
        ),
      ),
    );
  }
}

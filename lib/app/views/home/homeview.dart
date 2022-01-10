import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/icons.dart';
import 'package:think_it_up_app/app/views/dashboard/dashboard.dart';
import 'package:think_it_up_app/app/views/settings/setting_view.dart';
import 'package:think_it_up_app/app/views/winners/winner_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            height: 50,
            color: Colors.black,
            child: const TabBar(
              tabs: [
                CustomIcon(icon: CupertinoIcons.star),
                CustomIcon(icon: CupertinoIcons.home),
                CustomIcon(icon: CupertinoIcons.settings),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            WinnerView(),
            DashBoardView(),
            SettingView(),
          ],
        ),
      ),
    );
  }
}

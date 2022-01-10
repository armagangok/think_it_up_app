import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
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
            height: 60,
            color: Colors.black,
            child: const TabBar(
              tabs: [
                Icon(
                  CupertinoIcons.star,
                  size: 30,
                ),
                Icon(
                  CupertinoIcons.home,
                  size: 30,
                ),
                Icon(
                  CupertinoIcons.settings,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Draggable(
          feedback: const SizedBox(),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
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

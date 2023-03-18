import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return const DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavyBar(),
          body: TabBarWidget(),
        ),
      ),
    );
  }
}



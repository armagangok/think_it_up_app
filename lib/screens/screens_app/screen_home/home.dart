import 'dart:developer';

import 'package:flutter/material.dart';

import './components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomNavyBar(),
        body: TabBarWidget(),
      ),
    );
  }
}



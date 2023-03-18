import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 30);
  }
}

class MyIcon {
  static final MyIcon _singleton = MyIcon._internal();

  factory MyIcon() => _singleton;

  MyIcon._internal();

  Icon heart = const Icon(CupertinoIcons.heart);
  Icon redHeart = const Icon(
    CupertinoIcons.heart_fill,
    color: Colors.redAccent,
  );
  Icon brokenHeart = const Icon(
    CupertinoIcons.heart_fill,
    color: Colors.redAccent,
  );
  Icon eye = const Icon(CupertinoIcons.eye_fill);
  Image dislike =
      Image.asset("assets/icons/dislike.png", height: 20, width: 20);
  Image like = Image.asset("assets/icons/like.png", height: 20, width: 20);
  Widget chat = const Icon(CupertinoIcons.chat_bubble, size: 40);
}

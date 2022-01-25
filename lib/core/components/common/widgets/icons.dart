import 'package:flutter/cupertino.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 30);
  }
}

class AssetIcon {
  static final AssetIcon _singleton = AssetIcon._internal();

  factory AssetIcon() {
    return _singleton;
  }

  AssetIcon._internal();

  Icon eye = const Icon(CupertinoIcons.eye_fill);
  Image dislike =
      Image.asset("assets/icons/dislike.png", height: 20, width: 20);
  Image like = Image.asset("assets/icons/like.png", height: 20, width: 20);
  Widget chat = const Icon(CupertinoIcons.chat_bubble, size: 40);
}

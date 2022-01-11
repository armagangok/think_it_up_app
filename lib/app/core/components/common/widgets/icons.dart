import 'package:flutter/cupertino.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 30);
  }
}

const Icon eye = Icon(CupertinoIcons.eye_fill);

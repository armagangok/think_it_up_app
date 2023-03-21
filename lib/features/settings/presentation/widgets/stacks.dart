import 'package:flutter/material.dart';

import '../../../../core/components/alignment/alignment.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function onPressed;

  const SettingItem({
    Key? key,
    required this.text,
    this.icon = const Icon(Icons.arrow_forward_ios_rounded, size: 30),
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding5(
        child: CustomContainer(
          heigth: 40,
          child: SymmetricPadding(
            horizontal: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(text), icon],
            ),
          ),
        ),
      ),
    );
  }
}

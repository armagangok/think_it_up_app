import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function onPressed;

  const SettingItem({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding5(
        child: CustomContainer(
          heigth: 40,
          child: SymmetricPaddingH5(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                icon ?? const Icon(Icons.arrow_forward_ios_rounded, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


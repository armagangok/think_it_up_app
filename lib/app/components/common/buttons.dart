import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon? icon;
  final Widget? viewName;
  final Function? onPressed;

  const CustomIconButton({
    Key? key,
    this.icon,
    this.viewName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed!(),
      icon: icon!,
    );
  }
}

class CusomElevatedButton extends StatelessWidget {
  final String? text;
  final double? buttonH;
  final double? buttonW;

  const CusomElevatedButton({
    Key? key,
    this.text,
    this.buttonH,
    this.buttonW,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonH,
      width: buttonW,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("$text"),
      ),
    );
  }
}

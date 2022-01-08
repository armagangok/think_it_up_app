import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function? onPressed;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed!(),
      icon: icon,
      iconSize: 30,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? buttonHeigth;
  final double? buttonWidth;
  final double? fontSize;
  final double? radius;
  final void Function() onPressed;

  const CustomElevatedButton({
    Key? key,
    this.text = "",
    this.buttonHeigth,
    this.buttonWidth,
    this.fontSize,
    this.radius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeigth,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:think_it_up_app/global/local/base/icon_state_base.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Function? onPressed;
  // final IconStateBase iconStateBase;

  const CustomIconButton({
    Key? key,
    required this.icon,
    // required this.iconStateBase,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed!(),
      icon: icon,
      iconSize: 30,
      splashRadius: 1,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.longestSide,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}



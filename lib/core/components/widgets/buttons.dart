// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/extensions/context_extension.dart';

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
  final bool isLoading;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : Text(
                text,
                style: context.bodyLarge,
              ),
      ),
    );
  }
}

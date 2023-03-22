// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/export/core_export.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Function onPressed;
  // final IconStateBase iconStateBase;

  const CustomIconButton({
    Key? key,
    required this.icon,
    // required this.iconStateBase,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: icon,
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
      height: 50.h,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
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

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomBlinkingButton extends StatefulWidget {
  const CustomBlinkingButton({
    Key? key,
    required this.isExpanded,
  }) : super(key: key);

  final bool isExpanded;

  @override
  _CustomBlinkingButtonState createState() => _CustomBlinkingButtonState();
}

class _CustomBlinkingButtonState extends State<CustomBlinkingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.45,
      duration: const Duration(milliseconds: 600),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child:
          widget.isExpanded ? const Text("Register") : const Text("Register"),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

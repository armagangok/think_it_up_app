import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/theme/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  const CustomContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: customColor.contColor,
      ),
      child: child,
    );
  }
}

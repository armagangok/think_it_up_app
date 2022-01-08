import 'package:flutter/material.dart';

import 'package:think_it_up_app/app/theme/colors.dart';

/* CUSTOM CONTAINER */
class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? heigth;

  const CustomContainer({
    Key? key,
    required this.child,
    this.color,
    this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: color ?? CustomColor().mainColor,
      ),
      child: child,
    );
  }
}

/*PADDING  WIDGETS*/
class CustomPadding extends StatelessWidget {
  final Widget child;

  const CustomPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}

/*SIZED BOX WIDGETS */

class SizedBox10H extends StatelessWidget {
  const SizedBox10H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class SizedBox20H extends StatelessWidget {
  const SizedBox20H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}

class SizedBox20W extends StatelessWidget {
  const SizedBox20W({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 20);
  }
}

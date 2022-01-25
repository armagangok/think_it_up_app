import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/theme/colors.dart';

/* CUSTOM CONTAINER */
class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? heigth;
  final double? width;

  const CustomContainer({
    Key? key,
    required this.child,
    this.color,
    this.heigth,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
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
class Padding8 extends StatelessWidget {
  final Widget child;

  const Padding8({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}

class SymmetricPadding extends StatelessWidget {
  final Widget child;
  final double? horizontal;
  final double? vertical;

  const SymmetricPadding({
    Key? key,
    required this.child,
    this.horizontal,
    this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: child,
    );
  }
}

class Padding5 extends StatelessWidget {
  final Widget child;

  const Padding5({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}

/*SIZED BOX WIDGETS */

class SizedBox5H extends StatelessWidget {
  const SizedBox5H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 5);
  }
}

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

class Wrapper extends StatelessWidget {
  final Widget? topBar;
  final Widget body;
  final Widget? bottomBar;
  final double topBarHeight;

  const Wrapper({
    Key? key,
    this.topBar,
    required this.body,
    this.bottomBar,
    this.topBarHeight = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding8(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(topBarHeight),
            child: topBar ?? const SizedBox(),
          ),
          body: Padding5(
            child: body,
          ),
          bottomNavigationBar: bottomBar,
        ),
      ),
    );
  }
}

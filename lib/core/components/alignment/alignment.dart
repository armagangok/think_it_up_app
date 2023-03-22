import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/export/core_export.dart';

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
        color: color ?? kColor.mainColor,
      ),
      child: child,
    );
  }
}

///
/*PADDING  WIDGETS*/
///
class PaddingAll10 extends StatelessWidget {
  final Widget child;

  const PaddingAll10({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: child,
    );
  }
}

class SymmetricPadding extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;

  const SymmetricPadding({
    Key? key,
    required this.child,
    this.horizontal = 0,
    this.vertical = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
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
      padding: EdgeInsets.all(5.h),
      child: child,
    );
  }
}

///
/*SIZED BOX WIDGETS */
///
class SizedBox5H extends StatelessWidget {
  const SizedBox5H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 5.h);
  }
}

class SizedBox10H extends StatelessWidget {
  const SizedBox10H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10.h);
  }
}

class SizedBox20H extends StatelessWidget {
  const SizedBox20H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20.h);
  }
}

class SizedBox20W extends StatelessWidget {
  const SizedBox20W({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 20.w);
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
      child: PaddingAll10(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(topBarHeight.h),
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

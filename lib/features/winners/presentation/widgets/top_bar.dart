import 'package:flutter/material.dart';

import '../../../../../core/components/alignment/alignment.dart';
import '../../../../../core/components/widgets/text_widgets.dart';

class TopBar extends StatelessWidget {
  final String text;
  final Widget? icons;
  final double heigth;

  const TopBar({
    Key? key,
    required this.text,
    this.icons,
    this.heigth = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      heigth: heigth,
      child: Padding8(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icons ?? const SizedBox(),
            Text24B(text: text),
            icons ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

     // CustomIconButton(
          //   icon: const Icon(CupertinoIcons.back),
          //   onPressed: () => Navigator.pop(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const DashBoardView(),
          //     ),
          //   ),
          // ),
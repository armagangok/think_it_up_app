import 'package:flutter/material.dart';

import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/app/views/dashboard/dashboard.dart';

class TopBar extends StatelessWidget {
  final String text;

  final Widget? icons;

  const TopBar({
    Key? key,
    required this.text,
    this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      heigth: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const DashBoardView(),
              ),
            ),
          ),
          Text24B(text: text),
          icons ?? const SizedBox(),
        ],
      ),
    );
  }
}

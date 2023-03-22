import 'package:flutter/material.dart';

import '/core/export/core_export.dart';

class WinnerWidget extends StatelessWidget {
  const WinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: context.width(1),
      color: null,
      child: PaddingAll10(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text16(text: "what do you think?"),
            SizedBox10H(),
            Text16(text: "userName"),
            SizedBox10H(),
            Text13(text: "comment"),
            SizedBox10H(),
          ],
        ),
      ),
    );
  }
}

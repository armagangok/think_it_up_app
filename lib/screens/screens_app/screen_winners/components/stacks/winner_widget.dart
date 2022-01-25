import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/core/components/common/widgets/text_widgets.dart';
import '../../../../../core/extensions/context_extension.dart';

class WinnerWidget extends StatelessWidget {
  const WinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: context.getWidth(1),
      color: null,
      child: Padding8(
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

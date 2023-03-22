import 'package:flutter/cupertino.dart';

import '../../../../core/components/widgets/buttons.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: () {},
      icon: const Icon(
        CupertinoIcons.share,
        color: Color.fromARGB(255, 0, 255, 8),
      ),
    );
  }
}

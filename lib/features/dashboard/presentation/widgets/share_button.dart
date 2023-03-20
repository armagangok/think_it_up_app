import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/buttons.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomIconButton(
      icon: Icon(
        CupertinoIcons.share,
        color: Colors.greenAccent,
      ),
    );
  }
}

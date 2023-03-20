import 'package:flutter/cupertino.dart';

import '../../../../core/local/contracts/switch_base.dart';

class SwitchWidget extends StatelessWidget {
  final BaseSwitchVModel switchProvider;

  const SwitchWidget({
    Key? key,
    required this.switchProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: switchProvider.switchVal,
      onChanged: (t) => switchProvider.changeSwitch(),
    );
  }
}

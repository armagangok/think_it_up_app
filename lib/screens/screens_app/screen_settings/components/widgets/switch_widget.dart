import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:think_it_up_app/global/local/base/switch_base.dart';

class SwitchWidget extends StatelessWidget {
  final BaseViewModel switchProvider;

  const SwitchWidget({
    Key? key,
    required this.switchProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    return CupertinoSwitch(
      value: switchProvider.switchVal,
      onChanged: (t) => switchProvider.changeSwitch(),
    );
  }
}

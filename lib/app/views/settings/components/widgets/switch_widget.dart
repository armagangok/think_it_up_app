import 'package:flutter/cupertino.dart';

class SwitchWidget extends StatefulWidget {
  bool val = false;
  SwitchWidget({
    Key? key,
    required this.val,
  }) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.val,
      onChanged: (t) {
        setState(() {
          widget.val = t;
        });
      },
    );
  }
}

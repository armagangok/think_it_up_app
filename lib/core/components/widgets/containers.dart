import 'package:flutter/material.dart';
import '../../../global/constants/constants.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: kColor.textField,
      ),
      height: 3,
      width: 44,
    );
  }
}

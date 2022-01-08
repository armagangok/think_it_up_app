import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/theme/colors.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: CustomColor().textField,
      ),
      height: 3,
      width: 44,
    );
  }
}

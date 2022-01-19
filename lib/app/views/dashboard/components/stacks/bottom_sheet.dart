import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/containers.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_fields.dart';
import 'package:think_it_up_app/app/theme/colors.dart';

Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Padding5(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomContainer(
            heigth: MediaQuery.of(context).size.height * 0.75,
            color: CustomColor().bottomSheet,
            child: Padding5(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BottomSheetContainer(),
                      const SizedBox5H(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200.0),
                        child: CustomTextField(
                          boolean: false,
                          iconButton: IconButton(
                            onPressed: () => print("hello"),
                            icon: const Icon(CupertinoIcons.eye),
                          ),
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    text: "Share",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
// import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';
// import 'package:think_it_up_app/app/core/components/common/widgets/containers.dart';
// import 'package:think_it_up_app/app/core/components/common/widgets/text_fields.dart';
// import 'package:think_it_up_app/app/core/components/widgets_text_controller.dart';
// import 'package:think_it_up_app/app/theme/colors.dart';
// import 'package:think_it_up_app/app/views/winners/components/stacks/top_bar.dart';

// Future<dynamic> bottomSheet(BuildContext context) {
//   return showModalBottomSheet<dynamic>(
//     isScrollControlled: true,
//     backgroundColor: const Color.fromARGB(0, 0, 0, 0),
//     context: context,
//     builder: (context) => SingleChildScrollView(
//       child: Padding5(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: CustomContainer(
//             heigth: MediaQuery.of(context).size.height * 0.75,
//             color: CustomColor().bottomSheet,
//             child: Padding5(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       const BottomSheetContainer(),
//                       const SizedBox5H(),
//                       ConstrainedBox(
//                         constraints: const BoxConstraints(maxHeight: 200),
//                         child: CustomTextField(
//                           height: 55,
//                           controller: textControllers.emailLogin,
//                           boolean: false,
//                         ),
//                       ),
//                     ],
//                   ),
//                   CustomElevatedButton(
//                     text: "Share",
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

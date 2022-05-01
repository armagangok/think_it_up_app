// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
// import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';
// import 'package:think_it_up_app/app/views/winners/winner_view.dart';
// import 'bottom_sheet.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox10H(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomIconButton(
//               icon: Image.asset("assets/icons/medal.png"),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const WinnerView(),
//                 ),
//               ),
//             ),
//             CustomIconButton(
//               icon: const Icon(CupertinoIcons.chat_bubble),
//               onPressed: () => bottomSheet(context),
//             ),
//             CustomIconButton(
//               icon: const Icon(CupertinoIcons.home),
//               onPressed: () {},
//             ),
//             CustomIconButton(
//               icon: const Icon(CupertinoIcons.settings),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Container(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

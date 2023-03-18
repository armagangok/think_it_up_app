// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart'; import 'dart:developer';
// import 'package:think_it_up_app/core/components/widgets/text_fields.dart';
// import 'package:think_it_up_app/global/network/firebase/auth/viewmodels/user_viewmodel.dart';
// import 'package:think_it_up_app/screens/screens_app/screen_dashboard/networking/models/post_model.dart';

// import '../../../../core/components/alignment/alignment.dart';
// import '../../../../core/components/widgets/buttons.dart';
// import '../../../../core/components/widgets/containers.dart';
// import '../../../../core/theme/colors.dart';


// bottomSheet(BuildContext context, UserViewModel userViewModel) {
//   final TextEditingController commentController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;


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
//                           controller: commentController,
//                         ),
//                       ),
//                     ],
//                   ),
//                   CustomElevatedButton(
//                     text: "Share",
//                     onPressed: () async {
//                       var id2 = userViewModel.currentUser()!.id;

//                       PostModel postModel = PostModel(
//                         userName: userViewModel.currentUser()!.userName ??
//                             "Armağaann",
//                         comment: commentController.text,
//                         postID: id2!,
//                         likes: 0,
//                       );

//                       await _firestore
//                           .collection("posts")
//                           .doc(id2)
//                           .set(postModel.toMap());

//                       // Create post model
//                       // Save it on firestore

//                       //Postmodel properties: UID, comment, likes
//                     },
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

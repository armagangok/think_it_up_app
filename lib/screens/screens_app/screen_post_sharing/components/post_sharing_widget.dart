import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/buttons.dart';
import '../../../../core/components/widgets/containers.dart';
import '../../../../core/components/widgets/text_fields.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/colors.dart';
import '../../../../global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import '../../screen_dashboard/components/question_widget.dart';
import '../../screen_dashboard/networking/models/post_model.dart';

class PostSharingWidget extends StatelessWidget {
  const PostSharingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = Provider.of<UserViewModel>(context);
    final TextEditingController commentController = TextEditingController();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return SizedBox(
      height: context.getHeight(0.85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const QuestionWidget(),
          const SizedBox20H(),
          SingleChildScrollView(
            child: Padding5(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: CustomContainer(
                  heigth: context.getHeight(0.5),
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
                              constraints: const BoxConstraints(maxHeight: 200),
                              child: CustomTextField(
                                controller: commentController,
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          text: "Share",
                          onPressed: () async {
                            var id2 = userViewModel.currentUser()!.id;

                            PostModel postModel = PostModel(
                              userName: userViewModel.currentUser()!.userName ??
                                  "Armağaann",
                              comment: commentController.text,
                              postID: id2!,
                              likes: 0,
                            );

                            await _firestore
                                .collection("posts")
                                .doc(id2)
                                .set(postModel.toMap());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../../../../injection/injection_container.dart';
import '../../../auth/presentation/viewmodel/auth_viewmodel.dart';
import '../../../dashboard/data/view-models/firestore_viewmodel.dart';

class PostSharingWidget extends StatelessWidget {
  const PostSharingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    final userViewModel = getit.get<AuthViewModel>();
    final _firebase = getit.get<FirestoreVModel>();
    final TextEditingController commentController = TextEditingController();

    return SizedBox(
      height: context.height(0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox20H(),
          SingleChildScrollView(
            child: Padding5(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: CustomContainer(
                  heigth: context.height(0.5),
                  color: kColor.bottomSheet,
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
                            // PostModel postModel = PostModel(
                            //   userName: userViewModel.user!.userName!,
                            //   comment: commentController.text,
                            //   postID: userViewModel.user!.id!,
                            //   likes: 0,
                            // );
                            // print(userViewModel.user!.userName!);
                            // await _firebase.sharePost(postModel);
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

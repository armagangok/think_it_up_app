import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/buttons.dart';
import '../../../../core/components/widgets/containers.dart';
import '../../../../core/components/widgets/text_fields.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/colors.dart';
import '../../../../global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import '../../screen_dashboard/networking/models/post_model.dart';
import '../../screen_dashboard/networking/viewmodels/firebase_viewmodel.dart';

class PostSharingWidget extends StatelessWidget {
  const PostSharingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseModel userViewModel = Provider.of<FirebaseModel>(context);
    final FirebaseViewmodel _firebase = Provider.of<FirebaseViewmodel>(context);
    final TextEditingController commentController = TextEditingController();

    return SizedBox(
      height: context.getHeight(0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                            PostModel postModel = PostModel(
                              userName: userViewModel.user!.userName!,
                              comment: commentController.text,
                              postID: userViewModel.user!.id!,
                              likes: 0,
                            );
                            print(userViewModel.user!.userName!);                      
                            await _firebase.sharePost(postModel);
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

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../injection/injection_container.dart';
import '../../../auth/presentation/viewmodel/auth_viewmodel.dart';
import '../../data/models/post_model.dart';
import '../../data/view-models/firestore_viewmodel.dart';
import './share_button.dart';
import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/icons.dart';
import '../../../../core/extensions/context_extension.dart';

import '../../../../global/constants/constants.dart';

class CommentWidget extends StatelessWidget {
  final PostModel post;

  const CommentWidget({
    Key? key,
    this.setstate,
    required this.post,
  }) : super(key: key);

  final void Function()? setstate;

  @override
  Widget build(BuildContext context) {
    final _firebase = getit.get<AuthViewModel>();
    final _firestore = getit.get<FirestoreVModel>();

    final PostModel _post = post;
    // final AppUser _user = _firebase.user!;
    final TextTheme textTheme = context.theme.textTheme;

    // bool checkID = _checkPostID(_post.postID, _user.id!);

    return CustomContainer(
      color: kColor.bottomSheet,
      child: Padding8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("@" + _post.userName, style: textTheme.bodyMedium),
            const SizedBox10H(),
            Text(_post.comment, style: textTheme.bodyLarge),
            const SizedBox10H(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: setIcon(_post.isLiked),
                          onPressed: () async {
                            await _firestore
                                .updatePost(_post)
                                .then((value) => setstate!());
                          },
                        ),
                        Text("${_post.likes}"),
                      ],
                    ),
                    const SizedBox20W(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox20W(),
                    ShareButton(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget setIcon(bool isLiked) => isLiked ? MyIcon().redHeart : MyIcon().heart;

  bool _checkPostID(String postID, String userID) =>
      (postID == userID) ? true : false;
}

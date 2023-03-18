import 'package:flutter/material.dart';
import 'package:think_it_up_app/features/dashboard/data/services/base_database_service.dart';

import '../../../../injection/injection_container.dart';
import '../../../auth/presentation/viewmodel/auth_viewmodel.dart';
import '../../data/models/post_model.dart';
import './share_button.dart';
import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/icons.dart';
import '../../../../core/extensions/context_extension.dart';

import '../../../../global/constants/constants.dart';

class CommentWidget extends StatefulWidget {
  final PostModel post;

  const CommentWidget({
    Key? key,
    this.setstate,
    required this.post,
  }) : super(key: key);

  final void Function()? setstate;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final _firebase = getit.get<AuthViewModel>();
  final _firestore = getit.get<BaseDataService>();
  @override
  Widget build(BuildContext context) {
    final PostModel _post = widget.post;
    final TextTheme textTheme = context.theme.textTheme;

    return CustomContainer(
      color: kColor.bottomSheet,
      child: Padding8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@" + _post.userName,
              style: textTheme.bodyMedium,
            ),
            const SizedBox10H(),
            Text(
              _post.comment,
              style: textTheme.bodyLarge,
            ),
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
                                .then((value) => widget.setstate!());
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

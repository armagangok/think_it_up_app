import 'package:flutter/material.dart';

import '/core/components/widgets/icons.dart';
import '/core/export/core_export.dart';
import 'share_button.dart';

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
  // final _firebase = getit.get<AuthViewModel>();
  final _dashboardViewModel = getit.get<DashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: kColor.bottomSheet,
      child: PaddingAll8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@" + widget.post.userName,
              style: context.bodyMedium,
            ),
            const SizedBox10H(),
            Text(
              widget.post.comment,
              style: context.bodyLarge,
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
                        _likeButton(widget.post),
                        Text("${widget.post.likes}"),
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

  IconButton _likeButton(PostModel _post) {
    return IconButton(
      icon: setIcon(_post.isLiked),
      onPressed: () async {
        await _dashboardViewModel.updatePost(_post).then(
              (value) => widget.setstate!(),
            );

        await _dashboardViewModel.fetchPosts();
      },
    );
  }

  Widget setIcon(bool isLiked) => isLiked ? MyIcon().redHeart : MyIcon().heart;

  bool _checkPostID(String postID, String userID) =>
      (postID == userID) ? true : false;
}

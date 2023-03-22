// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '/core/export/core_export.dart';
import 'like_button.dart';
import 'share_button.dart';

class CommentWidget extends StatefulWidget {
  final PostModel post;

  const CommentWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: kColor.mainColor,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _userNameText(context),
            const SizedBox10H(),
            _commentText(context),
            const SizedBox10H(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        LikeButton(postModel: widget.post),
                        SizedBox(width: 10.w),
                        Text("${widget.post.likes}"),
                      ],
                    ),
                  ],
                ),
                const ShareButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _commentText(BuildContext context) {
    return Text(
      widget.post.comment,
      style: context.bodyLarge,
    );
  }

  Text _userNameText(BuildContext context) {
    return Text(
      "@" + widget.post.userName,
      style: context.bodyMedium,
    );
  }

  bool _checkPostID(String postID, String userID) =>
      (postID == userID) ? true : false;
}

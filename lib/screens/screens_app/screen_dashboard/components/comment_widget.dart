import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/buttons.dart';
import '../../../../core/components/widgets/icons.dart';
import '../networking/models/post_model.dart';

class CommentWidget extends StatelessWidget {
  final PostModel post;
  const CommentWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.userName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox10H(),
            Text(
              post.comment,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox10H(),
            InteractionRow(post: post),
          ],
        ),
      ),
    );
  }
}

class InteractionRow extends StatelessWidget {
  final PostModel post;
  const InteractionRow({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                LikeButton(post: post),
                Text("${post.likes}"),
              ],
            ),
            const SizedBox20W(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            SizedBox20W(),
            CustomIconButton(
              icon: Icon(
                CupertinoIcons.share,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LikeButton extends StatefulWidget {
  final PostModel post;
  const LikeButton({Key? key, required this.post}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: AssetIcon().redHeart,
      onPressed: () => setState(() {}),
    );
  }
}

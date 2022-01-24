import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/icons.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';

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
            IconButtonStack(post: post),
          ],
        ),
      ),
    );
  }
}

class IconButtonStack extends StatelessWidget {
  final PostModel post;
  const IconButtonStack({
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
                CustomIconButton(
                  icon: AssetIcon().like,
                  onPressed: () => debugPrint("like!"),
                ),
                Text("${post.likes}"),
              ],
            ),
            const SizedBox20W(),
            Row(
              children: [
                CustomIconButton(
                  icon: AssetIcon().dislike,
                  onPressed: () => debugPrint("disliked!"),
                ),
                Text("${post.dislikes}"),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox20W(),
            CustomIconButton(
              icon: const Icon(
                CupertinoIcons.share,
                color: Colors.greenAccent,
              ),
              onPressed: () => debugPrint("Share!"),
            ),
          ],
        ),
      ],
    );
  }
}


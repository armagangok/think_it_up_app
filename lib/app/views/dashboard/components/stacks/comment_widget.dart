import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';
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
            const IconButtonStack(),
          ],
        ),
      ),
    );
  }
}

class IconButtonStack extends StatelessWidget {
  const IconButtonStack({
    Key? key,
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
                  icon: Image.asset("assets/icons/like.png"),
                  onPressed: () => debugPrint("like!"),
                ),
                const Text("5k"),
              ],
            ),
            const SizedBox20W(),
            Row(
              children: [
                CustomIconButton(
                  icon: Image.asset("assets/icons/dislike.png"),
                  onPressed: () => debugPrint("disliked!"),
                ),
                const Text("100"),
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

const String comment =
    "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
const String userName = "@SampleUser1";

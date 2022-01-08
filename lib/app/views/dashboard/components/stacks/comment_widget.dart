import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/buttons.dart';

const String comment =
    "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
const String userName = "@SampleUser1";

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: null,
      child: CustomPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              userName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox10H(),
            Text(
              comment,
              style: TextStyle(fontSize: 12.5),
            ),
            SizedBox10H(),
            IconButtonStack(),
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

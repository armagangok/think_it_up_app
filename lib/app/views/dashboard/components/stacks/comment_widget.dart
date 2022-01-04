import 'package:flutter/cupertino.dart';
import 'package:think_it_up_app/app/components/common/widgets/container.dart';
import 'package:think_it_up_app/app/components/common/widgets/padding.dart';
import 'package:think_it_up_app/app/components/common/widgets/sizedbox.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "@SampleUser1",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox10H(),
            Text(
              "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
              children: const [
                Icon(CupertinoIcons.arrow_up_square),
                Text("5k"),
              ],
            ),
            const SizedBox20W(),
            Row(
              children: const [
                Icon(CupertinoIcons.arrow_down_square),
                Text("100"),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(CupertinoIcons.star),
            SizedBox20W(),
            Icon(CupertinoIcons.share),
          ],
        ),
      ],
    );
  }
}

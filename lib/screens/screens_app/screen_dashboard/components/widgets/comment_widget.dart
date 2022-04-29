import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';
import 'package:think_it_up_app/core/components/common/widgets/buttons.dart';
import 'package:think_it_up_app/core/components/common/widgets/icons.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/models/post_model.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/viewmodels/dashboard_viewmodel.dart';

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
              post.userName!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox10H(),
            Text(
              post.comment!,
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
  late bool isLiked;
  @override
  Widget build(BuildContext context) {
    DashVievModel dashBoardVievModel = Provider.of<DashVievModel>(context);
    return CustomIconButton(
      icon: dashBoardVievModel.posts[dashBoardVievModel.indexOfComment].isLiked
          ? AssetIcon().redHeart
          : AssetIcon().heart,
      onPressed: () {
        setState(
          () {
            dashBoardVievModel
                    .posts[dashBoardVievModel.indexOfComment].isLiked =
                !dashBoardVievModel
                    .posts[dashBoardVievModel.indexOfComment].isLiked;

            if (dashBoardVievModel
                    .posts[dashBoardVievModel.indexOfComment].isLiked ==
                true) {
              dashBoardVievModel.posts[dashBoardVievModel.indexOfComment]
                  .likes = (dashBoardVievModel
                      .posts[dashBoardVievModel.indexOfComment].likes! +
                  1);
            } else {
              dashBoardVievModel.posts[dashBoardVievModel.indexOfComment]
                  .likes = (dashBoardVievModel
                      .posts[dashBoardVievModel.indexOfComment].likes! +
                  1);
            }
          },
        );
      },
    );
  }
}

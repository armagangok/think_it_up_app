import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/buttons.dart';
import '../../../../core/components/widgets/icons.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/networking/firebase/view-models/firebase_viewmodel.dart';
import '../../../../global/constants/constants.dart';
import '../networking/models/post_model.dart';
import '../networking/view-models/firestore_viewmodel.dart';
import '../view-models/icon_state.dart';

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
    FirebaseViewmodel _userViewodel = Provider.of<FirebaseViewmodel>(context);
    IconState _iconState = Provider.of<IconState>(context);
    FirestoreViewmodel _firestore = Provider.of<FirestoreViewmodel>(context);

    return CustomContainer(
      color: checkID(widget.post.postID, _userViewodel.user!.id!)
          ? kColor.bgColor
          : null,
      child: Padding8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@" + widget.post.userName,
              style: context.theme.textTheme.bodyText2,
            ),
            const SizedBox10H(),
            Text(
              widget.post.comment,
              style: context.theme.textTheme.bodyText1,
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
                        CustomIconButton(
                          icon: setIcon(
                            _iconState,
                            _userViewodel.user!.likedPosts,
                            widget.post,
                          ),
                          onPressed: () async {
                            setState(() => _iconState.like());
                            await _state(_iconState, _firestore);
                          },
                        ),
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

  Future<void> _state(
    IconState _iconState,
    FirestoreViewmodel _firestore,
  ) async {
    if (_iconState.isLiked == true) {
      setState(() => {widget.post.likes++});
      await _firestore.updateLikes(widget.post);
    } else if (_iconState.isLiked == false) {
      setState(() => {widget.post.likes--});
      await _firestore.updateLikes(widget.post);
    }
  }

  Widget setIcon(
    IconState iconState,
    List<dynamic> likedPosts,
    PostModel post,
  ) {
    for (String likedPost in likedPosts) {
      if (likedPost == post.postID) {
        return AssetIcon().redHeart;
      } else {
        return AssetIcon().heart;
      }
    }

    return iconState.isLiked ? AssetIcon().redHeart : AssetIcon().heart;
  }

  bool checkID(String postID, String userID) {
    if (postID == userID) {
      return true;
    } else {
      return false;
    }
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomIconButton(
      icon: Icon(
        CupertinoIcons.share,
        color: Colors.greenAccent,
      ),
    );
  }
}

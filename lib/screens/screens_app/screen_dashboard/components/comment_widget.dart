import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/alignment/alignment.dart';
import '../../../../core/components/widgets/buttons.dart';
import '../../../../core/components/widgets/icons.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/networking/firebase/models/user_model.dart';
import '../../../../core/networking/firebase/view-models/firebase_viewmodel.dart';
import '../../../../global/constants/constants.dart';
import '../networking/models/post_model.dart';
import '../networking/view-models/firestore_viewmodel.dart';

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
  void initState() {
    super.initState();
  }

  // final bool _onPressed = false;

  @override
  Widget build(BuildContext context) {
    FirebaseViewmodel _firebase = Provider.of<FirebaseViewmodel>(context);
    FirestoreViewmodel _firestore = Provider.of<FirestoreViewmodel>(context);
    bool checkID2 = checkID(widget.post.postID, _firebase.user!.id!);
    final AppUser? _user = _firebase.user;

    bool _isLiked = widget.post.isLiked;
    return CustomContainer(
      color: checkID2 ? kColor.bgColor : null,
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
                        IconButton(
                          icon: _isLiked ? MyIcon().redHeart : MyIcon().heart,
                          onPressed: () async {
                            setState(() => _isLiked = !_isLiked);

                            if (_isLiked) {
                              await _firestore.addLikedUserID(
                                widget.post.postID,
                                _firebase.user!.id!,
                              );
                            } else {
                              await _firestore.deleteLikedUserID(
                                widget.post.postID,
                                _firebase.user!.id!,
                              );
                            }
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

  Widget setIcon(bool isLiked) => isLiked ? MyIcon().redHeart : MyIcon().heart;

  bool checkID(String postID, String userID) {
    if (postID == userID) {
      return true;
    } else {
      return false;
    }
  }
}

Widget setIconState(List? likedPostsIDS, String currentPostID) {
  for (String likedPostID in likedPostsIDS!) {
    if (likedPostID == currentPostID) {
      // print("likedpost $likedPostID");
      // print("current post   -> " + currentPostID);
      return MyIcon().redHeart;
    } else {
      return MyIcon().heart;
    }
  }
  return const SizedBox();
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


// await _userViewodel.setLikedPostID(
                              //   _userViewodel.user!,
                              //   widget.post.postID,
                              // );



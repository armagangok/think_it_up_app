import 'package:cloud_firestore/cloud_firestore.dart';
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
  Widget build(BuildContext context) {
    final FirebaseVmodel _firebase = Provider.of<FirebaseVmodel>(context);
    final FirestoreVmodel _firestore = Provider.of<FirestoreVmodel>(context);
    final PostModel _post = widget.post;
    final AppUser _user = _firebase.user!;
    final TextTheme textTheme = context.theme.textTheme;

    bool checkID = _checkPostID(_post.postID, _user.id!);
    bool _isLiked = _post.isLiked;

    print("->" "$_isLiked");

    return CustomContainer(
      color: checkID ? kColor.bottomSheet : null,
      child: Padding8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@" + _post.userName,
              style: textTheme.bodyText2,
            ),
            const SizedBox10H(),
            Text(
              _post.comment,
              style: textTheme.bodyText1,
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
// PostModel(userName: userName, comment: comment, postID: postID, likes: likes,);

                            // updatePost(PostModel post) async {
                            //   FirebaseFirestore.instance
                            //       .collection("posts")
                            //       .doc(post.postID)
                            //       .collection("usersLiked").doc(_user.id);
                            // }

                            // updatePost(_post);

                            print("-->" "$_isLiked");

                            setState(() => _isLiked = !_isLiked);

                            if (_isLiked) {
                              await _firestore.addLikedUserID(_post.postID);
                              setState(() => _post.likes++);
                              await _firestore.updateLikes(_post);
                              await _firestore.addLikedUserID(_post.postID);
                              await _firestore.updateLikeState(
                                _post.postID,
                                _isLiked,
                              );
                            } else {
                              await _firestore.deleteLikedUserID(_post.postID);
                              setState(() => _post.likes--);
                              await _firestore.updateLikes(_post);
                              await _firestore.addLikedUserID(_post.postID);
                              await _firestore.updateLikeState(
                                _post.postID,
                                _isLiked,
                              );
                            }
                          },
                        ),
                        Text("${_post.likes}"),
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

  bool _checkPostID(String postID, String userID) {
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

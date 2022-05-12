import 'dart:developer';

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

class CommentWidget extends StatelessWidget {
  final PostModel post;

  const CommentWidget({
    Key? key,
    this.setstate,
    required this.post,
  }) : super(key: key);

  final void Function()? setstate;

  @override
  Widget build(BuildContext context) {
    log(context.widget.runtimeType.toString() + "build run");
    final FirebaseVmodel _firebase = Provider.of<FirebaseVmodel>(context);
    final GlobalViewModel _firestore = Provider.of<GlobalViewModel>(context);
    final PostModel _post = post;
    final AppUser _user = _firebase.user!;
    final TextTheme textTheme = context.theme.textTheme;

    bool checkID = _checkPostID(_post.postID, _user.id!);

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
                          icon: _post.isLiked
                              ? MyIcon().redHeart
                              : MyIcon().heart,
                          onPressed: () async {
                            updatePost(PostModel post) async {
                              DocumentReference uidRef =
                                  FirebaseFirestore.instance
                                      .collection("posts")
                                      .doc(post.postID)
                                      .collection("usersLiked") //user1,user2,
                                      .doc(_user.id);

                              if (_post.isLiked) {
                                await uidRef.delete();
                              } else {
                                await uidRef.set({"id": _user.id});
                              }
                            }

                            await updatePost(_post)
                                .then((value) => setstate!());
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
    log(context.widget.runtimeType.toString() + "build run");
    return const CustomIconButton(
      icon: Icon(
        CupertinoIcons.share,
        color: Colors.greenAccent,
      ),
    );
  }
}

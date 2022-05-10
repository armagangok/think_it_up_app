import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/networking/firebase/models/user_model.dart';
import '../base_services/firestore_base_service.dart';
import '../models/post_model.dart';

class FirestoreService implements BaseFirestoreService {
  FirestoreService._private();
  static final FirestoreService _instance = FirestoreService._private();
  factory FirestoreService() => _instance;

  //
  //

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //
  //

  @override
  Future<List<PostModel>> getPosts() async {
    var querySnapshot = await _firestore.collection("posts").get();

    List<PostModel> _postModels = [];

    for (var postModel in querySnapshot.docs) {
      var snapshot = await _firestore
          .collection("posts")
          .doc(postModel.id)
          .collection("usersLiked")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      var post = PostModel.fromMap(postModel.data());

      if (snapshot.exists) {
        post.isLiked = true;
      }

      _postModels.add(post);
    }

    return _postModels;
  }

  //
  //

  @override
  Future<void> sharePost(PostModel postModel) async {
    await _firestore
        .collection("posts")
        .doc(postModel.postID)
        .set(postModel.toMap());
  }

  //
  //

  @override
  Future editPost() async {}

  //
  //

  @override
  Future<void> updateLikes(PostModel post) async {
    await _firestore.collection("posts").doc(post.postID).set(post.toMap());
  }

  //
  //

  @override
  Future<AppUser?> getUserData(String userID) async {
    await _firestore.collection("users").doc(userID).get();
    return null;
  }

  //
  //

  @override
  Future<void> addLikedUserID(String postID, String id) async {
    try {
      await _firestore
          .collection("posts")
          .doc(postID)
          .collection("usersLiked")
          .doc(id)
          .set({"id": id});
    } catch (e) {
      print(e);
    }
  }

  //
  //

  @override
  Future deleteLikedUserID(String postID, String id) async {
    await _firestore
        .collection("posts")
        .doc(postID)
        .collection("usersLiked")
        .doc(id)
        .delete();
  }

  @override
  Future<void> updateLikeState(String postID, bool isLiked) async {
    await _firestore
        .collection("posts")
        .doc(postID)
        .update({"isLiked": isLiked});
  }
}

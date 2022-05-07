import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/networking/firebase/models/user_model.dart';
import '../base_services/firestore_base_service.dart';
import '../models/post_model.dart';

class FirestoreService implements BaseFirestoreService {
  FirestoreService._private();

  static final FirestoreService _instance = FirestoreService._private();
  factory FirestoreService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<PostModel>> getPosts() async {
    var querySnapshot = await _firestore.collection("posts").get();

    List<PostModel> _postModels = [];

    for (var postModel in querySnapshot.docs) {
      _postModels.add(PostModel.fromMap(postModel.data()));
    }

    return _postModels;
  }

  @override
  Future<void> sharePost(PostModel postModel) async {
    await _firestore
        .collection("posts")
        .doc(postModel.postID)
        .set(postModel.toMap());
  }

  @override
  Future deletePost() async {}

  @override
  Future editPost() async {}

  @override
  Future<void> updateLikes(PostModel post) async {
    await _firestore.collection("posts").doc(post.postID).set(post.toMap());
  }

  @override
  Future<AppUser?> getUserData(String userID) async {
    await _firestore.collection("users").doc(userID).get();

    return null;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import './base/db_base.dart';
import '../models/post_model.dart';

class FirestoreService implements BaseDatabaseService {
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
      print(postModel);
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
  Future deletePost() {
    throw UnimplementedError();
  }

  @override
  Future editPost() {
    throw UnimplementedError();
  }

  // @override
  // Future deletePost() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future editPost() {
  //   throw UnimplementedError();
  // }

}

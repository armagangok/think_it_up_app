import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/networking/services/base/db_base.dart';

import '../models/post_model.dart';

class FirebaseService implements BaseDatabaseService {
  FirebaseService._private();

  static final FirebaseService _instance = FirebaseService._private();
  factory FirebaseService() => _instance;

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

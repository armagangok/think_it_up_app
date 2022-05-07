import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../base_services/firestore_base_service.dart';
import '../services/firestore_service.dart';

class FirestoreViewmodel with ChangeNotifier implements BaseFirestoreService {
  FirestoreViewmodel._private();
  static final FirestoreViewmodel _instance = FirestoreViewmodel._private();
  factory FirestoreViewmodel() => _instance;
  final FirestoreService _firebaseService = FirestoreService();

  List<PostModel> posts = [];

  @override
  Future deletePost() async {}

  @override
  Future editPost() async {}

  @override
  Future<List<PostModel>> getPosts() async {
    posts = await _firebaseService.getPosts();
    notifyListeners();
    return posts;
  }

  @override
  Future<void> updateLikes(PostModel post) async {
    await _firebaseService.updateLikes(post);
  }

  

  @override
  Future<void> sharePost(PostModel postModel) async {
    await _firebaseService.sharePost(postModel);
  }
}

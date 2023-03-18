import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/base_database_service.dart';
import '../services/firestore_service.dart';

class FirestoreVModel with ChangeNotifier implements BaseDataService {
  FirestoreVModel._private();
  static final FirestoreVModel _instance = FirestoreVModel._private();
  factory FirestoreVModel() => _instance;

  ///
  ///

  final FirestoreService _firestoreService = FirestoreService();

  ///
  ///
  List<PostModel> posts = [];

  @override
  Future<List<PostModel>> getPosts() async {
    posts = await _firestoreService.getPosts();
    return posts;
  }

  ///
  ///

  @override
  Future<void> sharePost(PostModel postModel) async {
    await _firestoreService.sharePost(postModel);
  }

  ///
  ///

  @override
  Future<void> updatePost(PostModel post) async {
    await _firestoreService.updatePost(post);
  }

  ///
  ///

  @override
  Future<String> getQuestion() async {
    return await _firestoreService.getQuestion();
  }
}

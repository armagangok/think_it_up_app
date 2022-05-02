import 'package:flutter/material.dart';


import '../models/post_model.dart';
import '../services/base/db_base.dart';
import '../services/current_db_service.dart';



class FirebaseViewmodel with ChangeNotifier implements BaseDatabaseService {
  FirebaseViewmodel._private();
  static final FirebaseViewmodel _instance = FirebaseViewmodel._private();
  factory FirebaseViewmodel() => _instance;

  final FirebaseService _firebaseService = FirebaseService();
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
  Future<void> sharePost(PostModel postModel) async {
    await _firebaseService.sharePost(postModel);
  }
}

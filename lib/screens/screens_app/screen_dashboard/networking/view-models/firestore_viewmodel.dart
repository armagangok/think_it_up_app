import 'package:flutter/material.dart';

import '../../../../../core/networking/firebase/models/user_model.dart';
import '../models/post_model.dart';
import '../base_services/firestore_base_service.dart';
import '../services/firestore_service.dart';

class FirestoreViewmodel with ChangeNotifier implements BaseFirestoreService {
  FirestoreViewmodel._private();
  static final FirestoreViewmodel _instance = FirestoreViewmodel._private();
  factory FirestoreViewmodel() => _instance;
  final FirestoreService _firestoreService = FirestoreService();
  

  List<PostModel> posts = [];

  @override
  Future deletePost() async {}

  @override
  Future editPost() async {}

  @override
  Future<List<PostModel>> getPosts() async {
    posts = await _firestoreService.getPosts();
    notifyListeners();
    return posts;
  }

  @override
  Future<void> updateLikes(PostModel post) async {
    await _firestoreService.updateLikes(post);
  }

  

  @override
  Future<void> sharePost(PostModel postModel) async {
    await _firestoreService.sharePost(postModel);
  }

  @override
  Future<AppUser?> getUserData(String userID) async{
    return await _firestoreService.getUserData(userID);
  }

  

}

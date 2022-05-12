import 'package:flutter/material.dart';

import '../../../../../core/networking/firebase/models/user_model.dart';
import '../base_services/firestore_base_service.dart';
import '../models/post_model.dart';
import '../services/firestore_service.dart';

class GlobalViewModel with ChangeNotifier implements BaseFirestoreService {
  GlobalViewModel._private();
  static final GlobalViewModel _instance = GlobalViewModel._private();
  factory GlobalViewModel() => _instance;
  final FirestoreService _firestoreService = FirestoreService();

  List<PostModel> posts = [];

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
  Future<AppUser?> getUserData() async {
    return await _firestoreService.getUserData();
  }

  @override
  Future<void> addLikedUserID(String postID) async {
    await _firestoreService.addLikedUserID(
      postID,
    );
  }

  @override
  Future deleteLikedUserID(
    String postID,
  ) async {
    await _firestoreService.deleteLikedUserID(
      postID,
    );
  }

  @override
  Future<void> updateLikeState(String postID, bool isLiked) async {
    await _firestoreService.updateLikeState(postID, isLiked);
  }
}


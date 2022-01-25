import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/models/post_model.dart';

import '../../../../global/network/firebase/firestore/services/db_base.dart';

class CurrentDbService implements DbBase {
  CurrentDbService._private();

  static final CurrentDbService _instance = CurrentDbService._private();
  factory CurrentDbService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> getPosts() async {
    var querySnapshot = await _firestore.collection("posts").get();

    List<PostModel> _postModels = [];

    for (var postModel in querySnapshot.docs) {
      _postModels.add(PostModel.fromMap(postModel.data()));
    }

    return _postModels;
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

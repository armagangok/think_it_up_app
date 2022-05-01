import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../global/network/firestore/services/db_base.dart';
import '../models/post_model.dart';


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
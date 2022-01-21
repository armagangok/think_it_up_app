import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/base/db_base.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';

class CurrentDbService implements DbBase {
  CurrentDbService._private();

  static final CurrentDbService _instance = CurrentDbService._private();
  factory CurrentDbService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<PostModel>> getPosts() async {
    var querySnapshot = await _firestore.collection("posts").get();

    List<PostModel> _postModels = [];

    for (var postModel in querySnapshot.docs) {
      print(postModel.data());
      _postModels.add(PostModel.fromMap(postModel.data()));
    }

    return _postModels;
  }

  @override
  Future deletePost() {
    throw UnimplementedError();
  }

  @override
  Future editPost() {
    throw UnimplementedError();
  }
}

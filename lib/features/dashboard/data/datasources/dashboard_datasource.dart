import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/core/export/core_export.dart';

class DashboardDataSource implements DashboardDataSourceContract {
  DashboardDataSource._private();
  static final DashboardDataSource _instance = DashboardDataSource._private();
  factory DashboardDataSource() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<List<PostModel>> fetchPosts() async {
    var querySnapshot = await _firestore.collection("posts").get();

    List<PostModel> _postModels = [];

    for (var postModel in querySnapshot.docs) {
      var usersLikedRef = _firestore
          .collection("posts")
          .doc(postModel.id)
          .collection("usersLiked");
  
      var snapshot =
          await usersLikedRef.doc(FirebaseAuth.instance.currentUser!.uid).get();

      var usersLiked = await usersLikedRef.get();
      var post = PostModel.fromMap(postModel.data());

      if (snapshot.exists) {
        post.isLiked = true;
      }

      post.likes = usersLiked.size;

      _postModels.add(post);
    }

  
    _postModels.sort((a, b) => b.likes.compareTo(a.likes));

    
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
  Future<void> updatePost(PostModel post) async {
    DocumentReference uidRef = FirebaseFirestore.instance
        .collection("posts")
        .doc(post.postID)
        .collection("usersLiked") //user1,user2,
        .doc(_auth.currentUser!.uid);

    if (post.isLiked) {
      await uidRef.delete();
    } else {
      await uidRef.set({"id": _auth.currentUser!.uid});
    }
  }

  @override
  Future<String> getQuestion() async {
    var querySnapshot = await _firestore.collection("question").get();
    var questionModel = querySnapshot.docs;

    return questionModel[0].data()['question'];
  }
}

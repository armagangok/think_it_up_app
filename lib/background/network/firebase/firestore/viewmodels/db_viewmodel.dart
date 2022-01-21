import 'package:think_it_up_app/background/locator/locator.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/base/db_base.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/services/current_db_service.dart';

class DbViewModel implements DbBase {
  final CurrentDbService _service = locator<CurrentDbService>();

  @override
  Future deletePost() {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future editPost() {
    // TODO: implement editPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final List<PostModel> posts = await _service.getPosts();
    for (PostModel item in posts) {
      print(item.like);
    }
    return posts;
  }
}



import '../../../../../screens/screens_app/screen_dashboard/networking/models/post_model.dart';
import '../../../../../screens/screens_app/screen_dashboard/networking/services/base/db_base.dart';
import '../../../../../screens/screens_app/screen_dashboard/networking/services/current_db_service.dart';
import '../../../locator/locator.dart';


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
    posts[0].userName;
    posts[0].comment;
    return posts;
  }
}

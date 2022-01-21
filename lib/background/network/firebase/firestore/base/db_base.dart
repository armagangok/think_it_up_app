import '../models/post_model.dart';

abstract class DbBase {
  Future<List<PostModel>> getPosts();
  Future deletePost();
  Future editPost();
}

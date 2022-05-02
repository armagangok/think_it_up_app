import '../../models/post_model.dart';

abstract class BaseDatabaseService {
  Future<List<PostModel>> getPosts();
  Future deletePost();
  Future editPost();
  Future<void> sharePost(PostModel postModel);
}

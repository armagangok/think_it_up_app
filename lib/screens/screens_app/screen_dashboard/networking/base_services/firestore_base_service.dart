import '../models/post_model.dart';

abstract class BaseFirestoreService {
  Future<List<PostModel>> getPosts();
  Future deletePost();
  Future editPost();
  Future<void> sharePost(PostModel postModel);
  Future<void> updateLikes(PostModel post);
}

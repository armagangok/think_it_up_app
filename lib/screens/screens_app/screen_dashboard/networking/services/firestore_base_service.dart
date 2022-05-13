import '../models/post_model.dart';

abstract class BaseFirestoreService {
  Future<List<PostModel>> getPosts();

  Future<void> sharePost(PostModel postModel);

  Future<void> updatePost(PostModel post);

  Future<String> getQuestion();
}

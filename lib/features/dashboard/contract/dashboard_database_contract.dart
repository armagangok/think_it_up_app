import '../data/models/post_model.dart';

abstract class DashboardDataSourceContract {
  Future<List<PostModel>> fetchPosts();

  Future<void> sharePost(PostModel postModel);

  Future<void> updatePost(PostModel post);

  Future<String> getQuestion();
}

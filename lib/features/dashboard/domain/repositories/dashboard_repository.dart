import '../../../../core/export/core_export.dart';

class DashboardRepository {
  DashboardRepository({
    required DashboardDataSourceContract dashboardDataSource,
  }) {
    _dashboardDataSource = dashboardDataSource;
  }

  late final DashboardDataSourceContract _dashboardDataSource;

  Future<Result<List<PostModel>>> fetchPosts() async {
    try {
      var response = await _dashboardDataSource.fetchPosts();
      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }

  Future<Result<String>> getQuestion() async {
    try {
      var response = await _dashboardDataSource.getQuestion();

      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }

  Future<Result> updatePost(PostModel post) async {
    try {
      await _dashboardDataSource.updatePost(post);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }

  Future<Result> sharePost(PostModel post) async {
    try {
      await _dashboardDataSource.sharePost(post);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }
}

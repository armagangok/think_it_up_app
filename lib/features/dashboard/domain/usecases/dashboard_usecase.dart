import '../repositories/dashboard_repository.dart';

import '/core/export/core_export.dart';

class DashboardUseCase {
  DashboardUseCase({
    required DashboardRepository dashboardRepository,
  }) {
    _dashboardRepository = dashboardRepository;
  }

  late final DashboardRepository _dashboardRepository;

  Future<Result<List<PostModel>>> fetchPosts() async {
    var response = await _dashboardRepository.fetchPosts();
    return response;
  }

  Future<Result<String>> getQuestion() async {
    var response = await _dashboardRepository.getQuestion();
    return response;
  }

  Future<Result> updatePost(PostModel post) async {
    return await _dashboardRepository.updatePost(post);
  }

  Future<Result> sharePost(PostModel post) async {
    var response = await _dashboardRepository.sharePost(post);

    return response;
  }
}

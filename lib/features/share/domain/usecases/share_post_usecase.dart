// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:think_it_up_app/core/export/core_export.dart';

class PostShareUseCase {
  late final DashboardRepository _dashboardRepository;
  PostShareUseCase({
    required DashboardRepository dashboardRepository,
  }) {
    _dashboardRepository = dashboardRepository;
  }

  Future<Result> sharePost(PostModel post) async {
    return _dashboardRepository.sharePost(post);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/export/core_export.dart';
import '../../domain/usecases/dashboard_usecase.dart';

final dashboardViewModel = ChangeNotifierProvider<DashboardViewModel>(
  (ref) => DashboardViewModel(
    dashboardUseCase: getit.get<DashboardUseCase>(),
  ),
);

class DashboardViewModel with ChangeNotifier {
  DashboardViewModel({
    required DashboardUseCase dashboardUseCase,
  }) {
    _dashboardUseCase = dashboardUseCase;
  }

  late final DashboardUseCase _dashboardUseCase;

  StateResult postState = const StateResult.initial();
  StateResult sharePostState = const StateResult.initial();
  StateResult updatePostState = const StateResult.initial();
  StateResult fetchQuestionState = const StateResult.initial();

  Future<void> fetchPosts() async {
    postState = const StateResult.loading();

    var response = await _dashboardUseCase.fetchPosts();

    response.when(
      success: (data) {
        postState = StateResult.completed(data);
        notifyListeners();
      },
      failure: (failure) {
        postState = StateResult.failed(failure);
        notifyListeners();
      },
    );
  }

  Future<void> sharePost(PostModel postModel) async {
    sharePostState = const StateResult.loading();

    var response = await _dashboardUseCase.sharePost(postModel);

    response.when(
      success: (data) {
        sharePostState = StateResult.completed(data);
        notifyListeners();
      },
      failure: (failure) {
        sharePostState = StateResult.failed(failure);
        notifyListeners();
      },
    );
  }

  Future<void> updatePost(PostModel post) async {
    updatePostState = const StateResult.loading();
    notifyListeners();

    var response = await _dashboardUseCase.updatePost(post);
    response.when(
      success: (data) {
        updatePostState = StateResult.completed(data);
        notifyListeners();
      },
      failure: (failure) {
        updatePostState = StateResult.failed(failure);
        notifyListeners();
      },
    );
  }

  Future<void> fetchQuestion() async {
    fetchQuestionState = const StateResult.loading();
    var response = await _dashboardUseCase.getQuestion();

    response.when(
      success: (data) {
        fetchQuestionState = StateResult.completed(data);
        notifyListeners();
      },
      failure: (failure) {
        fetchQuestionState = StateResult.failed(failure);
        notifyListeners();
      },
    );
  }
}

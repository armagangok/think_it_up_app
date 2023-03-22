// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:think_it_up_app/features/share/domain/usecases/share_post_usecase.dart';

import '../../../../core/export/core_export.dart';

final postShareViewModel = ChangeNotifierProvider<PostShareViewModel>(
    (ref) => getit.get<PostShareViewModel>());

class PostShareViewModel extends ChangeNotifier {
  late final PostShareUseCase _postShareUseCase;

  PostShareViewModel({
    required PostShareUseCase postShareUseCase,
  }) {
    _postShareUseCase = postShareUseCase;
  }

  StateResult sharePostState = const StateResult.initial();

  final commentController = TextEditingController();

  Future<void> sharePost(PostModel postModel) async {
    sharePostState = const StateResult.loading();
    notifyListeners();

    var response = await _postShareUseCase.sharePost(postModel);

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
}

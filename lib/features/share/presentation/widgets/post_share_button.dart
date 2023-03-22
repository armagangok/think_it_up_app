import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:think_it_up_app/features/share/presentation/viewmodel/post_share_viewodel.dart';

import '../../../../core/export/core_export.dart';

class PostShareButton extends ConsumerWidget {
  
  const PostShareButton({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomElevatedButton(
      isLoading: ref.watch(dashboardViewModel).sharePostState ==
          const StateResult.loading(),
      text: "Share",
      onPressed: () async {
        final _dashboardViewModel = ref.read(dashboardViewModel);
        final _homeViewModel = ref.read(homeViewModel);

        PostModel postModel = PostModel(
          userName: _homeViewModel.getCurrentUser!.userName,
          comment: ref.read(postShareViewModel).commentController.text,
          postID: _homeViewModel.getCurrentUser!.id,
          likes: 0,
        );

        await _dashboardViewModel.sharePost(postModel);
        await _dashboardViewModel.fetchPosts();
      },
    );
  }
}

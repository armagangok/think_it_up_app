import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/components/widgets/icons.dart';
import '../../../../core/export/core_export.dart';

class LikeButton extends ConsumerWidget {
  final PostModel postModel;
  const LikeButton({
    Key? key,
    required this.postModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        await ref.read(dashboardViewModel).updatePost(postModel);
        await ref.read(dashboardViewModel).fetchPosts();
      },
      child: setIcon(postModel.isLiked),
    );
  }

  Widget setIcon(bool isLiked) => isLiked ? MyIcon().redHeart : MyIcon().heart;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/post_share_viewodel.dart';
import '/core/export/core_export.dart';
import 'post_share_button.dart';

class PostSharingWidget extends ConsumerWidget {
  const PostSharingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height(0.7),
      child: Padding5(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox5H(),
                  Text(
                    "Type your idea...",
                    textAlign: TextAlign.left,
                    style: context.bodySmall.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 2.5.h),
                  _commentTextWidget(ref),
                  const SizedBox5H(),
                  // const BottomSheetContainer(),
                ],
              ),
              const PostShareButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _commentTextWidget(WidgetRef ref) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 550.h),
        child: CustomTextField(
          controller: ref.read(postShareViewModel).commentController,
        ),
      );
}

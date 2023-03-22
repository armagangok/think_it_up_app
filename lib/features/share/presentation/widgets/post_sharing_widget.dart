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
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding5(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BottomSheetContainer(),
                      const SizedBox5H(),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 570.h),
                        child: CustomTextField(
                          controller:
                              ref.read(postShareViewModel).commentController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const PostShareButton()
        ],
      ),
    );
  }
}

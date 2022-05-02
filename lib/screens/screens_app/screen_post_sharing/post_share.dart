import 'package:flutter/material.dart';

import './components/post_sharing_widget.dart';
import '../../../core/components/alignment/alignment.dart';

class SharePostScreen extends StatelessWidget {
  const SharePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      body: SingleChildScrollView(
        child: PostSharingWidget(),
      ),
    );
  }
}

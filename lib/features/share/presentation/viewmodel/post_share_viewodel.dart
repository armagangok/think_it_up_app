import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/export/core_export.dart';

final postShareViewModel = ChangeNotifierProvider<PostShareViewModel>(
    (ref) => getit.get<PostShareViewModel>());

class PostShareViewModel extends ChangeNotifier {
  final commentController = TextEditingController();
}

import 'package:flutter/material.dart';

import '../networking/models/post_model.dart';
import '../networking/services/current_db_service.dart';


class DashVievModel with ChangeNotifier {
  DashVievModel._private();
  static final DashVievModel _instance = DashVievModel._private();
  factory DashVievModel() => _instance;

  final CurrentDbService _currentDbService = CurrentDbService();

  int indexOfComment = 0;

  void changeIndexOfComment(int index) => indexOfComment = index;

  List<PostModel> posts = [];

  Future<void> getPosts() async {
    posts = await _currentDbService.getPosts();
    notifyListeners();
  }
}

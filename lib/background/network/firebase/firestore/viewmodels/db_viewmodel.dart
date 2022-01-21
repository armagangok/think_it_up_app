import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/background/locator/locator.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/base/db_base.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/services/current_db_service.dart';
import '../../../../locator/locator.dart';

class DbViewModel with ChangeNotifier implements DbBase {
  final CurrentDbService _service = locator<CurrentDbService>();

  @override
  Future deletePost() {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future editPost() {
    // TODO: implement editPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final List<PostModel> posts = await _service.getPosts();
    posts[0].userName;
    posts[0].comment;
    notifyListeners();
    return posts;
  }
}

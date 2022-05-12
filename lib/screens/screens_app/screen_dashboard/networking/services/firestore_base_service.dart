import '../../../../../core/networking/firebase/models/user_model.dart';
import '../models/post_model.dart';

abstract class BaseFirestoreService {
  Future<List<PostModel>> getPosts();

  Future<void> sharePost(PostModel postModel);

  Future<AppUser?> getUserData();

  Future<void> updatePost(PostModel post);
}

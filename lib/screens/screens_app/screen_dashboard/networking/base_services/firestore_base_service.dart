import '../../../../../core/networking/firebase/models/user_model.dart';
import '../models/post_model.dart';

abstract class BaseFirestoreService {
  Future<List<PostModel>> getPosts();
  Future editPost();
  Future<void> sharePost(PostModel postModel);
  Future<void> updateLikes(PostModel post);
  Future<AppUser?> getUserData();
  Future<void> addLikedUserID(String postID);
  Future<void> deleteLikedUserID(String postID);
  Future<void> updateLikeState(String postID, bool liked);
}

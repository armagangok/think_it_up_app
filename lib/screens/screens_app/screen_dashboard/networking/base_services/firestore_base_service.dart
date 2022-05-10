import '../../../../../core/networking/firebase/models/user_model.dart';
import '../models/post_model.dart';

abstract class BaseFirestoreService {
  Future<List<PostModel>> getPosts();
  Future editPost();
  Future<void> sharePost(PostModel postModel);
  Future<void> updateLikes(PostModel post);
  Future<AppUser?> getUserData(String userID);
  Future<void> addLikedUserID(String postID, String id);
    Future<void> deleteLikedUserID(String postID, String id);

}

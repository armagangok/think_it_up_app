import '../../../core/export/core_export.dart';

abstract class DashBoardDataSourceContract {
  Future<AppUser?> currentUser();

  Future<void> setLikedPostID(AppUser user, String likedPost);
}

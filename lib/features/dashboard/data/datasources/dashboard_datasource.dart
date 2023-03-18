import 'package:think_it_up_app/core/networking/firebase/models/user_model.dart';
import 'package:think_it_up_app/features/dashboard/contract/dashboard_database_contract.dart';

class DashBoardDataSource implements DashBoardDataSourceContract {
  
  @override
  Future<AppUser?> currentUser() async {
    return null;
  }

  @override
  Future<void> setLikedPostID(AppUser user, String likedPost) async {}
}

import '../../../../core/export/core_export.dart';

abstract class HomeDataSourceContract {
  Future<AppUser?> checkCurrentUser();
}
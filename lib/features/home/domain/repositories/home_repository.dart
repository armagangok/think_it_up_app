import 'package:think_it_up_app/features/home/data/contract/home_data_source.dart';

import '../../../../core/export/core_export.dart';

class HomeRepository {
  late final HomeDataSourceContract _homeDataSource;

  HomeRepository({
    required HomeDataSourceContract homeDataSource,
  }) {
    _homeDataSource = homeDataSource;
  }

  Future<Result<AppUser?>> checkCurrentUser() async {
    try {
      var response = await _homeDataSource.checkCurrentUser();
      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "$e"));
    }
  }
}

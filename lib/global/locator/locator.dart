import 'package:get_it/get_it.dart';

import '../../screens/screens_app/screen_dashboard/networking/services/current_db_service.dart';
import '../../screens/screens_app/screen_dashboard/networking/services/question_service.dart';
import '../network/firebase/auth/repository/user_repository.dart';
import '../network/firebase/auth/services/current_service.dart';
import '../network/firebase/auth/services/dummy_service.dart';

final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CurrentService());
  locator.registerLazySingleton(() => DummyService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => CurrentDbService());
  locator.registerLazySingleton(() => QuestionService());
}

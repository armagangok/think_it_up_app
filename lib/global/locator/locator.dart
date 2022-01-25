import 'package:get_it/get_it.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/services/question_service.dart';
import '../network/firebase/auth/repository/user_repository.dart';
import '../network/firebase/auth/services/dummy_service.dart';
import '../network/firebase/auth/services/current_service.dart';
import '../../screens/screens_app/screen_dashboard/services/current_db_service.dart';

final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CurrentService());
  locator.registerLazySingleton(() => DummyService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => CurrentDbService());
  locator.registerLazySingleton(() => QuestionService());
}

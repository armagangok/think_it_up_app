import 'package:get_it/get_it.dart';

import '../services/current_service.dart';
import '../services/dummy_service.dart';
import '../../../../screens/screens_app/screen_dashboard/networking/services/firestore_service.dart';
import '../../../../screens/screens_app/screen_dashboard/networking/services/question_service.dart';
import '../repository/user_repository.dart';


final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CurrentService());
  locator.registerLazySingleton(() => DummyService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => QuestionService());
}

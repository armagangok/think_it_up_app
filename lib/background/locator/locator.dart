import 'package:get_it/get_it.dart';

import '../network/firebase/auth/repository/user_repository.dart';
import '../network/firebase/auth/services/dummy_service.dart';
import '../network/firebase/auth/services/services.dart';
import '../network/firebase/firestore/services/current_db_service.dart';



final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => DummyService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => CurrentDbService());
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../core/export/core_export.dart';

final GetIt getit = GetIt.asNewInstance();

void setupDependencies() {
  setupDataSources();
  setupViewModels();
  setupRepositories();
  setupUseCases();

  getit.registerLazySingleton<NavigationServiceContract>(
    () => NavigationService.instance,
  );
}

void setupDataSources() {
  getit.registerLazySingleton<LoginDataSourceContract>(
    () => LoginDataSource(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );

  getit.registerLazySingleton(
    () => CurrentService(),
  );
  getit.registerLazySingleton(
    () => DummyService(),
  );
  getit.registerLazySingleton(
    () => FirestoreService(),
  );
}

void setupRepositories() {
  getit.registerLazySingleton<UserRepository>(() => UserRepository());
  getit.registerLazySingleton<AuthRepositoryContract>(
    () => AuthRepository(
      loginDataSource: getit(),
    ),
  );
}

void setupViewModels() {
  getit.registerLazySingleton<AuthViewModel>(
    () => AuthViewModel(
      authUseCase: getit(),
    ),
  );
}

void setupUseCases() {
  getit.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      authRepository: getit(),
    ),
  );
}

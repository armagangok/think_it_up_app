import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:think_it_up_app/core/export/core_export.dart';
import 'package:think_it_up_app/features/auth/data/contract/login_datasource_contract.dart';
import 'package:think_it_up_app/features/auth/domain/contract/auth_repository.dart';
import 'package:think_it_up_app/features/auth/domain/repositories/auth_repository.dart';

import '../core/networking/firebase/repository/user_repository.dart';
import '../core/networking/firebase/services/current_service.dart';
import '../core/networking/firebase/services/dummy_service.dart';
import '../features/auth/data/datasources/login_datasource.dart';
import '../features/auth/presentation/viewmodel/auth_viewmodel.dart';
import '../features/dashboard/data/services/firestore_service.dart';

final GetIt getit = GetIt.asNewInstance();

void setupDependencies() {
  setupDataSources();
  setupViewModels();
  setupRepositories();
  setupUseCases();
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

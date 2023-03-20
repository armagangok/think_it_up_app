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
  getit.registerLazySingleton<AuthDataSourceContract>(
    () => AuthDataSource(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );

  getit.registerLazySingleton<DashboardDataSourceContract>(
    () => DashboardDataSource(),
  );

  getit.registerLazySingleton<HomeDataSourceContract>(
    () => HomeDataSource(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );
}

void setupRepositories() {
  getit.registerLazySingleton<AuthRepositoryContract>(
    () => AuthRepository(
      loginDataSource: getit(),
    ),
  );

  getit.registerLazySingleton<DashboardRepository>(
    () => DashboardRepository(
      dashboardDataSource: getit(),
    ),
  );

  getit.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      homeDataSource: getit(),
    ),
  );
}

void setupViewModels() {
  getit.registerLazySingleton<AuthViewModel>(
    () => AuthViewModel(
      authUseCase: getit(),
    ),
  );

  getit.registerLazySingleton<DashboardViewModel>(
    () => DashboardViewModel(dashboardUseCase: getit()),
  );

  getit.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(homeUseCase: getit()),
  );
}

void setupUseCases() {
  getit.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      authRepository: getit(),
    ),
  );

  getit.registerLazySingleton<HomeUseCase>(
    () => HomeUseCase(
      homeRepository: getit(),
    ),
  );

  getit.registerLazySingleton<DashboardUseCase>(
    () => DashboardUseCase(
      dashboardRepository: getit(),
    ),
  );
}

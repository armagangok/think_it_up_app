import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:think_it_up_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:think_it_up_app/features/dashboard/domain/usecases/dashboard_usecase.dart';

import '../core/export/core_export.dart';
import '../features/dashboard/presentation/viewmodels/dashboard_viewmodel.dart';

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
  getit.registerLazySingleton<DashboardDataSourceContract>(
    () => DashboardDataSource(),
  );
}

void setupRepositories() {
  getit.registerLazySingleton<UserRepository>(
    () => UserRepository(),
  );
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
}

void setupUseCases() {
  getit.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      authRepository: getit(),
    ),
  );

  getit.registerLazySingleton<DashboardUseCase>(
    () => DashboardUseCase(
      dashboardRepository: getit(),
    ),
  );
}

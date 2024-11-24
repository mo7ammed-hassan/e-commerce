import 'package:get_it/get_it.dart';
import 'package:t_store/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:t_store/features/authentication/data/repository/onboarding_repository_impl.dart';
import 'package:t_store/features/authentication/data/source/authentication_source/authentication_firebase_services.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';
import 'package:t_store/features/authentication/domain/repository/onboarding_repository.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_first_launch_use_case.dart';
import 'package:t_store/features/authentication/domain/use_cases/signup_usecase.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // ------Services------
  getIt.registerSingleton<AuthenticationFirebaseServices>(
    AuthenticationFirebaseServicesImpl(),
  );

  // ------Repositories------
  getIt.registerSingleton<OnboardingRepository>(
    OnboardingRepositoryImpl(),
  );
  getIt.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );

  // ------Usecases------
  getIt.registerLazySingleton<IsFirstLaunchUseCase>(
    () => IsFirstLaunchUseCase(),
  );
  getIt.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );
}

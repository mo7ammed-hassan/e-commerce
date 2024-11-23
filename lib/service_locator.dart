import 'package:get_it/get_it.dart';
import 'package:t_store/features/authentication/data/repository/onboarding_repository_impl.dart';
import 'package:t_store/features/authentication/domain/repository/onboarding_repository.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_first_launch_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // services

  // Repositories
  getIt.registerSingleton<OnboardingRepository>(
    OnboardingRepositoryImpl(),
  );

  // UseCases

  getIt.registerLazySingleton<IsFirstLaunchUseCase>(
    () => IsFirstLaunchUseCase(),
  );
}

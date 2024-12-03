import 'package:get_it/get_it.dart';
import 'package:t_store/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:t_store/features/authentication/data/repository/onboarding_repository_impl.dart';
import 'package:t_store/features/authentication/data/source/authentication_source/authentication_firebase_services.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';
import 'package:t_store/features/authentication/domain/repository/onboarding_repository.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_first_launch_use_case.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_verified_email_use_case.dart';
import 'package:t_store/features/authentication/domain/use_cases/logout_use_case.dart';
import 'package:t_store/features/authentication/domain/use_cases/reset_password_usecase.dart';
import 'package:t_store/features/authentication/domain/use_cases/send_email_verification_usecase.dart';
import 'package:t_store/features/authentication/domain/use_cases/signin_usecase.dart';
import 'package:t_store/features/authentication/domain/use_cases/signin_with_google.dart';
import 'package:t_store/features/authentication/domain/use_cases/signup_usecase.dart';
import 'package:t_store/features/personalization/data/repository/user_repository_impl.dart';
import 'package:t_store/features/personalization/data/source/user_firebase_services.dart';
import 'package:t_store/features/personalization/domain/repository/user_repository.dart';
import 'package:t_store/features/personalization/domain/use_cases/fetch_user_data_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // ------Services------
  getIt.registerSingleton<AuthenticationFirebaseServices>(
    AuthenticationFirebaseServicesImpl(),
  );
  getIt.registerSingleton<UserFirebaseServices>(
    UserFirebaseServiceImpl(),
  );

  // ------Repositories------
  getIt.registerSingleton<OnboardingRepository>(
    OnboardingRepositoryImpl(),
  );
  getIt.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(),
  );

  // ------Usecases------
  getIt.registerLazySingleton<IsFirstLaunchUseCase>(
    () => IsFirstLaunchUseCase(),
  );
  getIt.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );
  getIt.registerSingleton<SendEmailVerificationUsecase>(
    SendEmailVerificationUsecase(),
  );

  getIt.registerSingleton<IsVerifiedEmailUseCase>(
    IsVerifiedEmailUseCase(),
  );

  getIt.registerSingleton<SignInUsecase>(
    SignInUsecase(),
  );
  getIt.registerSingleton<ResetPasswordUsecase>(
    ResetPasswordUsecase(),
  );
  getIt.registerSingleton<LogoutUseCase>(
    LogoutUseCase(),
  );
  getIt.registerSingleton<SigninWithGoogle>(
    SigninWithGoogle(),
  );
  getIt.registerSingleton<FetchUserDataUseCase>(
    FetchUserDataUseCase(),
  );
}

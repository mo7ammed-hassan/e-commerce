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
import 'package:t_store/features/personalization/data/repository/upload_data_repository_impl.dart';
import 'package:t_store/features/personalization/data/repository/user_repository_impl.dart';
import 'package:t_store/features/personalization/data/source/firebase_storage_services.dart';
import 'package:t_store/features/personalization/data/source/uplaod_data_firebase_services.dart';
import 'package:t_store/features/personalization/data/source/user_firebase_services.dart';
import 'package:t_store/features/personalization/domain/repository/upload_data_repository.dart';
import 'package:t_store/features/personalization/domain/repository/user_repository.dart';
import 'package:t_store/features/personalization/domain/use_cases/delete_account_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/delete_user_account_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/fetch_user_data_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/re_auth_user_account_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/update_user_filed_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_data_usecases/upload_categories_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_user_image_use_case.dart';
import 'package:t_store/features/shop/features/home/data/repository/banner_repository_impl.dart';
import 'package:t_store/features/shop/features/home/data/repository/category_repositoy_impl.dart';
import 'package:t_store/features/shop/features/home/data/source/banner_firebase_services.dart';
import 'package:t_store/features/shop/features/home/data/source/category_firebase_services.dart';
import 'package:t_store/features/shop/features/home/domain/repository/banner_repository.dart';
import 'package:t_store/features/shop/features/home/domain/repository/category_repositoy.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/banner_use_case.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/category_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // ------Services------
  getIt.registerSingleton<AuthenticationFirebaseServices>(
    AuthenticationFirebaseServicesImpl(),
  );
  getIt.registerSingleton<UserFirebaseServices>(
    UserFirebaseServiceImpl(),
  );
  getIt.registerSingleton<CategoryFirebaseServices>(
    CategoryFirebaseServicesImpl(),
  );
  getIt.registerSingleton<FirebaseStorageServices>(
    FirebaseStorageServicesImpl(),
  );
  getIt.registerSingleton<UploadDataFirebaseServices>(
    UploadDataFirebaseServicesImpl(),
  );
  getIt.registerSingleton<BannerFirebaseServices>(
    BannerFirebaseServicesImpl(),
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
  getIt.registerSingleton<CategoryRepositoy>(
    CategoryRepositoyImpl(),
  );
  getIt.registerSingleton<UploadDataRepository>(
    UploadDataRepositoryImpl(),
  );
  getIt.registerSingleton<BannerRepository>(
    BannerRepositoryImpl(),
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
  getIt.registerSingleton<SigninWithGoogleUseCase>(
    SigninWithGoogleUseCase(),
  );
  getIt.registerSingleton<FetchUserDataUseCase>(
    FetchUserDataUseCase(),
  );
  getIt.registerSingleton<UpdateUserFiledUseCase>(
    UpdateUserFiledUseCase(),
  );
  getIt.registerSingleton<ReAuthUserAccountUseCase>(
    ReAuthUserAccountUseCase(),
  );
  getIt.registerSingleton<DeleteUserAccountUseCase>(
    DeleteUserAccountUseCase(),
  );
  getIt.registerSingleton<DeleteAccountUseCase>(
    DeleteAccountUseCase(),
  );
  getIt.registerSingleton<UploadUserImageUseCase>(
    UploadUserImageUseCase(),
  );
  getIt.registerSingleton<CategoryUseCase>(
    CategoryUseCase(),
  );
  getIt.registerSingleton<UploadDummyDataUseCase>(
    UploadDummyDataUseCase(),
  );
  getIt.registerSingleton<BannerUseCase>(
    BannerUseCase(),
  );
}

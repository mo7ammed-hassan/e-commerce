import 'package:get_it/get_it.dart';
import 'package:t_store/common/services/local_storage_services.dart';
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
import 'package:t_store/features/personalization/data/source/remote/firebase_storage_services.dart';
import 'package:t_store/features/personalization/data/source/remote/uplaod_data_firebase_services.dart';
import 'package:t_store/features/personalization/data/source/remote/user_firebase_services.dart';
import 'package:t_store/features/personalization/domain/repository/upload_data_repository.dart';
import 'package:t_store/features/personalization/domain/repository/user_repository.dart';
import 'package:t_store/features/personalization/domain/use_cases/delete_account_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/delete_user_account_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/fetch_user_data_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/re_auth_user_account_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/update_user_filed_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_data_usecases/upload_categories_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_data_usecases/upload_product_use_case.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_user_image_use_case.dart';
import 'package:t_store/features/shop/features/all_brands/data/repository/brands_repository_impl.dart';
import 'package:t_store/features/shop/features/all_brands/data/source/brands_firebase_services.dart';
import 'package:t_store/features/shop/features/all_brands/domain/usecases/get_all_brands_use_case.dart';
import 'package:t_store/features/shop/features/all_brands/domain/usecases/get_featured_brands_use_case.dart';
import 'package:t_store/features/shop/features/all_brands/presentation/cubits/brand_cubit.dart';
import 'package:t_store/features/shop/features/all_products/data/repository/product_repository_impl.dart';
import 'package:t_store/features/shop/features/all_products/data/source/product_firebase_services.dart';
import 'package:t_store/features/shop/features/all_products/domain/repository/product_repository.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_all_products_by_brand_use_cse.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_popular_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_fetured_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_cubit.dart';
import 'package:t_store/features/shop/features/home/data/repository/banner_repository_impl.dart';
import 'package:t_store/features/shop/features/home/data/repository/category_repository_impl.dart';
import 'package:t_store/features/shop/features/home/data/source/remote/banner_firebase_services.dart';
import 'package:t_store/features/shop/features/home/data/source/remote/category_firebase_services.dart';
import 'package:t_store/features/shop/features/home/domain/repository/banner_repository.dart';
import 'package:t_store/features/shop/features/home/domain/repository/category_repositoy.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/banner_use_case.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/category_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // ------Services------
  // --Remote
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

  // --Local
  getIt.registerSingleton<LocalStorageServices>(
    LocalStorageServicesImpl(),
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
  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositoyImpl(),
  );
  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(ProductFirebaseServicesImpl()),
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
  getIt.registerSingleton<GetAllBrandsUseCase>(
    GetAllBrandsUseCase(
      BrandsRepositoryImpl(
        BrandsFirebaseServicesImpl(),
      ),
    ),
  );
  getIt.registerSingleton<GetFeaturedBrandsUseCase>(
    GetFeaturedBrandsUseCase(
      BrandsRepositoryImpl(
        BrandsFirebaseServicesImpl(),
      ),
    ),
  );
  // --Upload Data
  getIt.registerSingleton<UploadDummyDataUseCase>(
    UploadDummyDataUseCase(),
  );
  getIt.registerSingleton<UploadProductUseCase>(
    UploadProductUseCase(),
  );
  // --Banners
  getIt.registerSingleton<BannerUseCase>(
    BannerUseCase(),
  );
  // --Products
  getIt.registerSingleton<GetPopularProductsUseCase>(
    GetPopularProductsUseCase(),
  );
  getIt.registerSingleton<GetFeturedProductsUseCase>(
    GetFeturedProductsUseCase(),
  );
  getIt.registerSingleton<GetAllProductsByBrandUseCse>(
    GetAllProductsByBrandUseCse(),
  );

  // -- Cubits--
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit());
  getIt.registerLazySingleton<BrandCubit>(() => BrandCubit());
}

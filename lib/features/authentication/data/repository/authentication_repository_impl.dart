import 'package:dartz/dartz.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';
import 'package:t_store/features/authentication/data/source/authentication_source/authentication_firebase_services.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';
import 'package:t_store/service_locator.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<Either> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either> sigin(UserSigninModel userSigninModel) {
    // TODO: implement sigin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(UserCreationModel userCreationModel) async {
    var returnedData =
        await getIt<AuthenticationFirebaseServices>().signup(userCreationModel);

    return returnedData.fold(
      (errorMessage) {
        return Left(errorMessage);
      },
      (successMessage) {
        return Right(successMessage);
      },
    );
  }

  @override
  Future<Either> verifyEmail() async {
    var returnedData =
        await getIt<AuthenticationFirebaseServices>().verifyEmail();

    return returnedData.fold(
      (errorMessage) {
        return Left(errorMessage);
      },
      (successMessage) {
        return Right(successMessage);
      },
    );
  }

  @override
  Future<bool> isVerifiedEmail() async {
   return await getIt<AuthenticationFirebaseServices>().isVerifiedEmail();
  }
}

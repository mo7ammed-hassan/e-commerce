import 'package:dartz/dartz.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';

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
  Future<Either> signup(UserCreationModel userCreationModel) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either> verifyEmail({required String email}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}

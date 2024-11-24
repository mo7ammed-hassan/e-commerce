import 'package:dartz/dartz.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';

abstract class AuthenticationFirebaseServices {
  Future<Either> signup(UserCreationModel usetCreationModel);
  Future<Either> sihnin(UserSigninModel userSigninModel);
  Future<Either> isLoggedIn();
  Future<bool> logout();
  Future<Either> resetPassword({required String email});
  Future<Either> verifyEmail({required String email});
}

class FirebaseAuthenticationServicesImpl
    extends AuthenticationFirebaseServices {
  @override
  Future<Either> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(UserCreationModel usetCreationModel) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either> sihnin(UserSigninModel userSigninModel) {
    // TODO: implement sihnin
    throw UnimplementedError();
  }

  @override
  Future<Either> verifyEmail({required String email}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}

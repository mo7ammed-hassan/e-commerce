import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either> signup();
  Future<Either> sihnin();
  Future<Either> isLoggedIn();
  Future<Either> logout();
  Future<Either> resetPassword();
  Future<Either> verifyEmail();
}

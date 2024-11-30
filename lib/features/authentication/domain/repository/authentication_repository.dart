import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';

abstract class AuthenticationRepository {
  Future<Either> signup(UserCreationModel userCreationModel);
  Future<Either> signIn(UserSigninModel userSigninModel);
  Future<Either> logout();
  Future<Either> resetPassword({required String email});
  Future<Either> sendEmailVerification();
  Future<bool> isVerifiedEmail(User? user);
}

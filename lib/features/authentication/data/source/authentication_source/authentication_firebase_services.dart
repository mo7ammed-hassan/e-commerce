import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';
import 'package:t_store/utils/helpers/password_helper.dart';

abstract class AuthenticationFirebaseServices {
  Future<Either> signup(UserCreationModel userCreationModel);
  Future<Either> signin(UserSigninModel userSigninModel);
  Future<Either> isLoggedIn();
  Future<bool> logout();
  Future<Either> resetPassword({required String email});
  Future<Either> verifyEmail({required String email});
}

class AuthenticationFirebaseServicesImpl
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
  Future<Either> signup(UserCreationModel userCreationModel) async {
    try {
      // Create user in Firebase Auth
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userCreationModel.userEmail,
        password: userCreationModel.password,
      );

      // --  Hash the password --
      final hashedPassword =
          TPasswordHelper.hashPassword(userCreationModel.password);

      // Store user in Firestore
      userCreationModel.userID = credential.user!.uid;
      userCreationModel.password = hashedPassword; // Store hashed password
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(credential.user!.uid)
          .set(
            userCreationModel.toMap(),
          );
      return const Right(
        'Your Account has been created! Verify email to continue',
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    } catch (e) {
      return const Left('There was an error, please try again');
    }
  }

  @override
  Future<Either> signin(UserSigninModel userSigninModel) {
    // TODO: implement sihnin
    throw UnimplementedError();
  }

  @override
  Future<Either> verifyEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.setLanguageCode("en");
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      return const Right('Email verification sent successfully');
    } catch (e) {
      return const Left('There was an error, please try again');
    }
  }
}

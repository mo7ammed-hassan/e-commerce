import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/data/models/user_model.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';
import 'package:t_store/utils/helpers/password_helper.dart';

abstract class AuthenticationFirebaseServices {
  Future<Either> signup(UserCreationModel userCreationModel);
  Future<Either> signin(UserSigninModel userSigninModel);
  Future<Either> logout();
  Future<Either> resetPassword({required String email});
  Future<Either> sendEmailVerification();
  Future<bool> isVerifiedEmail(User? user);
  Future<Either<String, UserCredential>> signInWithGoogle();
}

class AuthenticationFirebaseServicesImpl
    extends AuthenticationFirebaseServices {
  final FirebaseAuth _user = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _user.signOut();
      return const Right('Success Logout');
    } catch (e) {
      return const Left('There was an error, please try again');
    }
  }

  @override
  Future<Either> resetPassword({required String email}) async {
    try {
      await _user.sendPasswordResetEmail(email: email);
      return const Right('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      }
      return Left(message);
    } catch (e) {
      return const Left('There was an error, please try again');
    }
  }

  @override
  Future<Either> signup(UserCreationModel userCreationModel) async {
    try {
      // Create user in Firebase Auth
      final UserCredential credential =
          await _user.createUserWithEmailAndPassword(
        email: userCreationModel.userEmail,
        password: userCreationModel.password,
      );

      // --  Hash the password --
      final hashedPassword =
          TPasswordHelper.hashPassword(userCreationModel.password);

      // Store user in Firestore
      userCreationModel.userID = credential.user!.uid;
      userCreationModel.password = hashedPassword; // Store hashed password
      await _firebaseFirestore
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
  Future<Either> signin(UserSigninModel userSigninModel) async {
    try {
      UserCredential user = await _user.signInWithEmailAndPassword(
        email: userSigninModel.uerEmail,
        password: userSigninModel.password,
      );

      return Right(user.user);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }

      return Left(message);
    } catch (e) {
      return const Left('There was an error, please try again');
    }
  }

  @override
  Future<Either> sendEmailVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      return const Right('Email verification sent successfully');
    } catch (e) {
      return const Left('There was an error, please try again');
    }
  }

  @override
  Future<bool> isVerifiedEmail(User? user) async {
    if (user != null) {
      await user.reload(); // Refresh user data
      return user.emailVerified;
    }
    return false;
  }

  @override
  Future<Either<String, UserCredential>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Storage User Data to Firestore
      await saveUserRecord(userCredential);

      return Right(userCredential);
    } catch (e) {
      return const Left('Google sign-in failed');
    }
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    // Storage User Data to Firestore
    final nameParts = userCredential.user!.displayName!.split(" ");
    final userName = generateUsername(userCredential.user!.displayName ?? "");

    final userData = UserModel(
      userId: userCredential.user!.uid,
      firstName: nameParts[0],
      lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
      userName: userName,
      userEmail: userCredential.user!.email ?? '',
      userPhone: userCredential.user!.phoneNumber ?? '',
      userImage: userCredential.user!.photoURL ?? '',
    );

    await _firebaseFirestore
        .collection('Users')
        .doc(userCredential.user!.uid)
        .set(userData.toMap());
  }

  String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[0].toLowerCase() : "";

    String username = "swg_$lastName$firstName";

    return username;
  }
}

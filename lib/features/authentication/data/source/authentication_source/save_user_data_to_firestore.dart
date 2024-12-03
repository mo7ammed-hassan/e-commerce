import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:t_store/features/authentication/data/models/user_model.dart';

class SaveUserDataToFirestore {
  static Future<void> saveUserRecord(UserCredential userCredential) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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

    await firebaseFirestore
        .collection('Users')
        .doc(userCredential.user!.uid)
        .set(userData.toMap());
  }

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String username = "${firstName}_$lastName";

    return username;
  }
}

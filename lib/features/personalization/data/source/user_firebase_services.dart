import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class UserFirebaseServices {
  Future<Either<String, Map<String, dynamic>>> fetchUserData();
  Future<Either> updateUserField({required Map<String, dynamic> data});
}

class UserFirebaseServiceImpl implements UserFirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  @override
  Future<Either<String, Map<String, dynamic>>> fetchUserData() async {
    final userId = _auth.currentUser!.uid;

    final documentSnapshot = await _store.collection('Users').doc(userId).get();

    try {
      if (documentSnapshot.exists) {
        final userData =
            documentSnapshot.data(); // convert document snapshot to JSON
        if (kDebugMode) {
          print(userData);
        }
        return Right(userData!);
      } else {
        return const Left('User not found');
      }
    } catch (e) {
      return Left('Error fetching user data: $e');
    }
  }

  @override
  Future<Either> updateUserField({required Map<String, dynamic> data}) async {
    final userId = _auth.currentUser!.uid;

    try {
      await _store.collection('Users').doc(userId).update(data);
      return const Right('Successfully updated');
    } catch (e) {
      return Left('Error updating user field: $e');
    }
  }
}

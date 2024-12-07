import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';

abstract class CategoryFirebaseServices {
  Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
      getAllCategories();
}

class CategoryFirebaseServicesImpl extends CategoryFirebaseServices {
  final _storage = FirebaseFirestore.instance;

  @override
  Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
      getAllCategories() async {
    try {
      final snapshot = await _storage.collection('Categories').get();

      final list = snapshot.docs.map((document) => document).toList();

      return Right(list);
    } on FirebaseException catch (e) {
      String message = TFirebaseException(e.code).message;
      return Left(message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

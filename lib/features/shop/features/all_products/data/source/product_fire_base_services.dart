import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseServices {
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProducts();

  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedProducts();
}

class ProductFirebaseServicesImpl implements ProductFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProducts() async {
    try {
      var data = await _firestore.collection('Products').limit(20).get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedProducts() async {
    try {
      var data = await _firestore
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          //.limit(4)
          .get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }
}

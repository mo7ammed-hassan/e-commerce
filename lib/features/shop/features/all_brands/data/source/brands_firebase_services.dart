import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class BrandsFirebaseServices {
  // -- Get Featured Brands --
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedBrands({required int limit});

  // -- Get All Brands --
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllBrands({required int limit});
}

class BrandsFirebaseServicesImpl implements BrandsFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedBrands({int limit = 4}) async {
    try {
      var data = await _firestore
          .collection('Brands')
          .where('isFeatured', isEqualTo: true)
          .limit(limit)
          .get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllBrands({int limit = 16}) async {
    try {
      var data = await _firestore.collection('Brands').limit(limit).get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }
}

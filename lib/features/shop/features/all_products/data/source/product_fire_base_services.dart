import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseServices {
  // --get popular and featured products--
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProducts();

  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedProducts({required int limit});

  // --get all prodcuts--
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllFeaturedProducts({required int limit});
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllPopularProducts({required int limit});

  // --get all products by category--
  // Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>> getAllProductsByCategory();

  // --get all products by sub category--
  // Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>> getAllProductsBySubCategory();

  // --get all products by brand--
  // Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>> getAllProductsByBrand();
}

class ProductFirebaseServicesImpl implements ProductFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProducts() async {
    try {
      var data = await _firestore.collection('Products').limit(4).get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedProducts({required int limit}) async {
    try {
      var data = await _firestore
          .collection('Products')
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
      getAllFeaturedProducts({required int limit}) async {
    try {
      var data = await _firestore
          .collection('Products')
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
      getAllPopularProducts({required int limit}) async {
    try {
      var data = await _firestore
          .collection('Products')
          //.where('isPopular', isEqualTo: true)
          .limit(limit)
          .get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }
}

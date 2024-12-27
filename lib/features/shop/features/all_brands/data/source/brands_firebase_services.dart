import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class BrandsFirebaseServices {
  // -- Get Featured Brands --
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getFeaturedBrands({required int limit});

  // -- Get All Brands --
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllBrands({required int limit});

  // -- Get Brand Specific Category --
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getBrandSpecificCategory(
          {required String categoryId, required int limit});
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

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getBrandSpecificCategory(
          {required String categoryId, required int limit}) async {
    try {
      // Getting the brand ids from the BrandCategory collection
      var brandCategory = await _firestore
          .collection('BrandCategory')
          .where('brandId', isEqualTo: categoryId)
          .get();

      // Extracting the brand ids
      var brandIds =
          brandCategory.docs.map((brand) => brand['brandId']).toList();

      if (brandIds.isEmpty) return const Right([]);

      // Getting the brands from the Brands collection
      final brandsQuery = await _firestore
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(limit)
          .get();

      return Right(brandsQuery.docs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

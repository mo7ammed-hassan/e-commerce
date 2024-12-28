import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/firebase_collections/collections.dart';

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
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProductsSpecificCategory(
          {required String categoryId, required int limit});

  // --get all products by sub category--
  // Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>> getAllProductsBySubCategory();

  // --get all products by brand--
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProductsByBrand({required String brandId, required int limit});
}

class ProductFirebaseServicesImpl implements ProductFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProducts() async {
    try {
      var data = await _firestore
          .collection(FirebaseCollections.PRODUCTS_COLLECTION)
          .limit(4)
          .get();

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
          .collection(FirebaseCollections.PRODUCTS_COLLECTION)
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
          .collection(FirebaseCollections.PRODUCTS_COLLECTION)
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
          .collection(FirebaseCollections.PRODUCTS_COLLECTION)
          //.where('isPopular', isEqualTo: true)
          .limit(limit)
          .get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProductsByBrand(
          {required String brandId, required int limit}) async {
    try {
      var data = await _firestore
          .collection(FirebaseCollections.PRODUCTS_COLLECTION)
          .where('brand.id', isEqualTo: brandId)
          .limit(limit)
          .get();

      return Right(data.docs);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getAllProductsSpecificCategory(
          {required String categoryId, required int limit}) async {
    try {
      var productCategoryQuary = await _firestore
          .collection(FirebaseCollections.PRODUCTS_CATEGORY_COLLECTION)
          .where('categoryId', isEqualTo: categoryId)
          .get();

      var productIds = productCategoryQuary.docs
          .map((product) => product['productId'])
          .toList();

      if (productIds.isEmpty) return const Right([]);

      var products = await _firestore
          .collection(FirebaseCollections.PRODUCTS_COLLECTION)
          .where(FieldPath.documentId, whereIn: productIds)
          .limit(limit)
          .get();

      return Right(products.docs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

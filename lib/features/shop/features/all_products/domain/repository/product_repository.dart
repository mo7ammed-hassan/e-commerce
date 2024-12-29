import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class ProductRepository {
  // --get popular and featured products--
  Future<Either<dynamic, List<ProductEntity>>> getPopularProducts();
  Future<Either<dynamic, List<ProductEntity>>> getFeaturedProducts(
      {int limit = 4});

  // --get all prodcuts--
  Future<Either<dynamic, List<ProductEntity>>> getAllFeaturedProducts(
      {required int limit});
  Future<Either<dynamic, List<ProductEntity>>> getAllPopularProducts(
      {required int limit});

  // --get all products by category--
  Future<Either<dynamic, List<ProductEntity>>> getAllProductsSpecificCategory(
      {required String categoryId, required int limit});

  // --get all products by sub category--
  // Future<Either<dynamic, List<ProductEntity>>> getAllProductsBySubCategory();

  // --get all products by brand--
  Future<Either<dynamic, List<ProductEntity>>> getAllProductsByBrand(
      {required String brandId, required int limit});

  Future<Either<dynamic, List<ProductEntity>>> fetchWishlistProducts(
      {required List<String> productIds});
}

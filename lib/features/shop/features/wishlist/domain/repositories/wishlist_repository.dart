import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class WishlistRepository {
  Future<void> addProductToWishlist(String productId);
  Future<void> removeProductFromWishlist(String productId);
  Future<bool> isProductInWishlist(String productId);
  Future<void> clearWishlist();

  Future<Either<dynamic, List<ProductEntity>>> fetchWishlist();
}

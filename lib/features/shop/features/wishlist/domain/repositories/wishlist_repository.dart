import 'package:dartz/dartz.dart';

abstract class WishlistRepository {
  Future<void> addProductToWishlist(String productId);
  Future<void> removeProductFromWishlist(String productId);
  Future<bool> isProductInWishlist(String productId);
  Future<void> clearWishlist();

  Future<Either<dynamic, List<String>>> fetchWishlist();
}

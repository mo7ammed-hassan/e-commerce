import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/wishlist/domain/repositories/wishlist_repository.dart';

class WislistRepositoryImpl implements WishlistRepository {
  @override
  Future<void> addProductToWishlist(String productId) {
    // TODO: implement addProductToWishlist
    throw UnimplementedError();
  }

  @override
  Future<void> clearWishlist() {
    // TODO: implement clearWishlist
    throw UnimplementedError();
  }

  @override
  Future<Either<dynamic, List<ProductEntity>>> fetchWishlist() {
    // TODO: implement fetchWishlist
    throw UnimplementedError();
  }

  @override
  Future<bool> isProductInWishlist(String productId) {
    // TODO: implement isProductInWishlist
    throw UnimplementedError();
  }

  @override
  Future<void> removeProductFromWishlist(String productId) {
    // TODO: implement removeProductFromWishlist
    throw UnimplementedError();
  }
}

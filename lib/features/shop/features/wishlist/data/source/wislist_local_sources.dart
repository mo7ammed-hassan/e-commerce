import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class WishlistLocalSources {
  bool isProductInWishlist(String productId, {required String userId});
  Future<void> toggleProductInWishlist(String productId,
      {required String userId});
  Future<void> clearWishlist({required String userId});
  Either<String, List<String>> fetchWishlist({required String userId});
}

class WislistLocalSourcesImpl implements WishlistLocalSources {
  @override
  Future<void> toggleProductInWishlist(String productId,
      {required String userId}) async {
    final wishlistBox = Hive.box('wishlist_$userId');
    if (wishlistBox.containsKey(productId)) {
      await wishlistBox.delete(productId);
    } else {
      await wishlistBox.put(productId, DateTime.now().toString());
    }
  }

  @override
  Either<String, List<String>> fetchWishlist({required String userId}) {
    // Get Box
    final wishlistBox = Hive.box('wishlist_$userId');
    try {
      var wishlistIds = wishlistBox.keys.cast<String>().toList();
      if (wishlistIds.isEmpty) return const Right([]);
      return Right(wishlistIds);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> clearWishlist({required String userId}) async {
    final wishlistBox = Hive.box('wishlist_$userId');
    await wishlistBox.clear();
  }

  @override
  bool isProductInWishlist(String productId, {required String userId}) {
    //final wishlistBox = await openUserWishlistBox();
    final wishlistBox = Hive.box('wishlist_$userId');
    return wishlistBox.containsKey(productId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class WishlistLocalSources {
  bool isProductInWishlist(String productId);
  Future<void> toggleProductInWishlist(String productId);
  Future<void> clearWishlist();
  Either<String, List<String>> fetchWishlist();
}

class WislistLocalSourcesImpl implements WishlistLocalSources {
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> toggleProductInWishlist(String productId) async {
    final wishlistBox = Hive.box('wishlist_$userId');
    if (wishlistBox.containsKey(productId)) {
      await wishlistBox.delete(productId);
    } else {
      await wishlistBox.put(productId, DateTime.now().toString());
    }
  }

  @override
  Either<String, List<String>> fetchWishlist() {
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
  Future<void> clearWishlist() async {
    final wishlistBox = Hive.box('wishlist_$userId');
    await wishlistBox.clear();
  }

  @override
  bool isProductInWishlist(String productId) {
    //final wishlistBox = await openUserWishlistBox();
    final wishlistBox = Hive.box('wishlist_$userId');
    return wishlistBox.containsKey(productId);
  }
}

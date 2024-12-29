import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/repository/product_repository.dart';
import 'package:t_store/features/shop/features/wishlist/data/source/wislist_local_sources.dart';
import 'package:t_store/features/shop/features/wishlist/presentation/pages/cubits/wishlist_state.dart';
import 'package:t_store/service_locator.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final WishlistLocalSources localSources = getIt<WishlistLocalSources>();
  final ProductRepository productRepository = getIt<ProductRepository>();

  // Fetch Wishlist items
  Future<void> fetchWishlist() async {
    // Get Wishlist Items From Local Storage
    final wishlist = localSources.fetchWishlist();
    wishlist.fold(
      (error) => emit(
        WishlistError(error),
      ),
      (wishlistItems) async {
        // Fetch Wishlist Items From Server
        var result = await productRepository.fetchWishlistProducts(
          productIds: wishlistItems,
        );

        result.fold(
          (error) {
            emit(WishlistError(error));
          },
          (wishlistProducts) {
            emit(WishlistLoaded(wishlistProducts));
          },
        );
      },
    );
  }

  // Clear Wishlist
  Future<void> clearWishlist() async {
    await localSources.clearWishlist();
  }
}

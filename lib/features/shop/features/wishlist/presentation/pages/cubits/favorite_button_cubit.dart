import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/wishlist/data/source/wislist_local_sources.dart';
import 'package:t_store/features/shop/features/wishlist/presentation/pages/cubits/favorite_button_state.dart';
import 'package:t_store/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  WishlistLocalSources localSources = getIt.get<WishlistLocalSources>();

  List<ProductEntity> wishlist = [];

  // Toggle Product in Wishlist
  Future<void> toggleWishlist(String productId) async {
    try {
      await localSources.toggleProductInWishlist(productId);
      wishlist.removeWhere((product) => product.id == productId);

      emit(ToggleFavoriteButton());
    } catch (e) {
      emit(FavoriteButtonError(e.toString()));
    }
  }

  // Check if Product is in Wishlist
  bool checkProductInWishlist(String productId) {
    bool isInWishlist = localSources.isProductInWishlist(productId);
    return isInWishlist;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/wishlist/data/source/wislist_local_sources.dart';
import 'package:t_store/features/shop/features/wishlist/presentation/pages/cubits/favorite_button_state.dart';
import 'package:t_store/features/shop/features/wishlist/presentation/pages/cubits/wishlist_cubit.dart';
import 'package:t_store/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit(this._wishlistCubit) : super(FavoriteButtonInitial());
  final WishlistCubit _wishlistCubit; // Inject WishlistCubit

  WishlistLocalSources localSources = getIt.get<WishlistLocalSources>();

  final _userID = FirebaseAuth.instance.currentUser!.uid;

  // Toggle Product in Wishlist
  Future<void> toggleWishlist(String productId) async {
    try {
      await localSources.toggleProductInWishlist(productId, userId: _userID);
      emit(ToggleFavoriteButton());

      // After toggling, fetch the updated wishlist
      if (!isClosed) {
        await _wishlistCubit.fetchWishlist();
      }
    } catch (e) {
      emit(FavoriteButtonError(e.toString()));
    }
  }

  // Check if Product is in Wishlist
  bool checkProductInWishlist(String productId) {
    bool isInWishlist =
        localSources.isProductInWishlist(productId, userId: _userID);
    return isInWishlist;
  }
}

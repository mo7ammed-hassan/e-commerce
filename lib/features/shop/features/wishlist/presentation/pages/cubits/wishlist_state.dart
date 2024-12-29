import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}

class WishlistLoaded extends WishlistState {
  List<ProductEntity> wishlist;

  WishlistLoaded(this.wishlist);
}


import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';

abstract class CartMangmentService {
   // -- Add to cart--
  Future<void> addToCart({required ProductModel product});
  // -- Add Single Item to cart--
  Future<void> addSingleItemToCart({required CartItemModel cartItem});
  // -- Remove Single Item from cart--
  Future<void> removeSingleItemFromCart({required CartItemModel cartItem});
}
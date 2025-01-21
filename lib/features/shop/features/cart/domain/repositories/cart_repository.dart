import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';

abstract class CartRepository {
  Future<void> addProductToCart(
      {required ProductModel product, int quantity = 1});
  Future<void> addSingleItemToCart({required CartItemModel cartItem});
  Future<void> removeSingleItemFromCart({required CartItemModel cartItem});
  Future<void> removeAllItemsFromCart();
}

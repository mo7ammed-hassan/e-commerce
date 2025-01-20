import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';

abstract class CartLocalStorageServices {
  // -- Store items in cart--
  Future<void> storeCartItems({required List<String> cartItems, required String box});
  // -- Fetch items from cart--
  Future<List<CartItemModel>> fetchCartItems({required String box});
 
}
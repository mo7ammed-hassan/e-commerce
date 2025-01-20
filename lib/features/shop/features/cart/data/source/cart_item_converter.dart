import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';

abstract class CartItemConverter {
  // --Convert productModel to CartItem--
  CartItemModel convertProductToCartItem({required ProductModel product});
}

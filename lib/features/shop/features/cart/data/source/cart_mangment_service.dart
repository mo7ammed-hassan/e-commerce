import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_local_storage_services.dart';

abstract class CartMangmentService {
  // -- Add to cart--
  Future<void> addToCart({required ProductModel product});
  // -- Add Single Item to cart--
  Future<void> addSingleItemToCart({required CartItemModel cartItem});
  // -- Remove Single Item from cart--
  Future<void> removeSingleItemFromCart({required CartItemModel cartItem});
  // -- Remove all items from cart--
  Future<void> removeAllItemsFromCart();
}

class CartMangmentServiceImpl implements CartMangmentService {
  final CartLocalStorageServices cartLocalStorageServices;
  static final String _userId = FirebaseAuth.instance.currentUser!.uid;
  static final String _boxName = '${_userId}Cart';

  CartMangmentServiceImpl(this.cartLocalStorageServices);
  @override
  Future<void> addSingleItemToCart({required CartItemModel cartItem}) async {
    List<CartItemModel> cartItems =
        await cartLocalStorageServices.fetchCartItems(box: _boxName);

    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId &&
        item.variationId == cartItem.variationId);

    if (index != -1) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(cartItem);
    }

    cartLocalStorageServices.storeCartItems(cartItems: cartItems);
  }

  @override
  Future<void> addToCart({required ProductModel product}) async {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<void> removeAllItemsFromCart() async {
    var cartBox = await Hive.openBox(_boxName);
    await cartBox.clear();
  }

  @override
  Future<void> removeSingleItemFromCart(
      {required CartItemModel cartItem}) async {
    List<CartItemModel> cartItems =
        await cartLocalStorageServices.fetchCartItems(box: _boxName);

    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId &&
        item.variationId == cartItem.variationId);

    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems.removeAt(index);
      }
    }

    cartLocalStorageServices.storeCartItems(cartItems: cartItems);
  }
}

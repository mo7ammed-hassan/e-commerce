import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/mappers_or_factories/cart_item_factory.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_local_storage_services.dart';

abstract class CartMangmentService {
  // -- Add to cart--
  Future<void> addProductToCart({required ProductModel product, int quantity});
  // -- Add Single Item to cart--
  Future<void> addSingleItemToCart({required CartItemModel cartItem});
  // -- Remove Single Item from cart--
  Future<void> removeSingleItemFromCart({required CartItemModel cartItem});
  // -- Remove all items from cart--
  Future<void> removeAllItemsFromCart();
}

class CartMangmentServiceImpl implements CartMangmentService {
  final CartLocalStorageServices cartLocalStorageServices;
  final CartItemFactoryInterface cartItemFactory;

  CartMangmentServiceImpl(this.cartLocalStorageServices, this.cartItemFactory);
  @override
  Future<void> addSingleItemToCart({required CartItemModel cartItem}) async {
    List<CartItemModel> cartItems =
        await cartLocalStorageServices.fetchCartItems();

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
  Future<void> addProductToCart(
      {required ProductModel product, int quantity = 1}) async {
    var cartItem =
        cartItemFactory.createCartItem(product: product, quantity: quantity);

    await addSingleItemToCart(cartItem: cartItem);
  }

  @override
  Future<void> removeAllItemsFromCart() async {
    List<CartItemModel> cartItems =
        await cartLocalStorageServices.fetchCartItems();
    cartItems.clear();

    cartLocalStorageServices.storeCartItems(cartItems: cartItems);
  }

  @override
  Future<void> removeSingleItemFromCart(
      {required CartItemModel cartItem}) async {
    List<CartItemModel> cartItems =
        await cartLocalStorageServices.fetchCartItems();

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

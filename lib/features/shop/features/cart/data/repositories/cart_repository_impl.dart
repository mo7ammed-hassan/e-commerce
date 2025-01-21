import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_mangment_service.dart';
import 'package:t_store/features/shop/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartMangmentService cartMangmentService;

  CartRepositoryImpl(this.cartMangmentService);
  @override
  Future<void> addProductToCart(
      {required ProductModel product, int quantity = 1}) async {
    await cartMangmentService.addProductToCart(
        product: product, quantity: quantity);
  }

  @override
  Future<void> addSingleItemToCart({required CartItemModel cartItem}) async {
    await cartMangmentService.addSingleItemToCart(cartItem: cartItem);
  }

  @override
  Future<void> removeAllItemsFromCart() async {
    await cartMangmentService.removeAllItemsFromCart();
  }

  @override
  Future<void> removeSingleItemFromCart(
      {required CartItemModel cartItem}) async {
    await cartMangmentService.removeSingleItemFromCart(cartItem: cartItem);
  }
}

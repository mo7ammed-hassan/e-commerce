import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/data/mappers_or_factories/cart_item_factory.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_local_storage_services.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_mangment_service.dart';
import 'package:t_store/features/shop/features/cart/presentation/widgets/cart_items.dart';
import 'package:t_store/features/shop/features/checkout/presentation/pages/checkout_page.dart';
import 'package:t_store/features/shop/features/product_details/presentation/cubits/product_variation_cubit.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _checkoutButton(context),
      appBar: _appBar(context),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TSizes.spaceBtwItems,
          vertical: TSizes.defaultSpace,
        ),
        child: CartItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          CartMangmentService cartMangmentService = CartMangmentServiceImpl(
            CartLocalStorageServicesImpl(),
            DefaultCartItemFactory(
              ProductVariationCubit(),
            ),
          );

          await cartMangmentService.addProductToCart(
              product: ProductModel.empty());

          CartLocalStorageServicesImpl().fetchCartItems().then((value) {
            print(value.length);
          });

          await cartMangmentService.removeAllItemsFromCart();

          CartLocalStorageServicesImpl().fetchCartItems().then((value) {
            print(value.length);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  TAppBar _appBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        'Cart',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _checkoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.spaceBtwItems,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckoutPage(),
            ),
          );
        },
        child: const Text('Checkout \$300'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_local_storage_services.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_mangment_service.dart';
import 'package:t_store/features/shop/features/cart/presentation/widgets/cart_items.dart';
import 'package:t_store/features/shop/features/checkout/presentation/pages/checkout_page.dart';
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
        onPressed: () {
          // CartLocalStorageServicesImpl().storeCartItems(cartItems: [
          //   CartItemModel(
          //       productId: '1',
          //       title: 'Product 1',
          //       quantity: 1,
          //       price: 100,
          //       selectedVariation: {'color': 'red'}),
          //   CartItemModel(productId: '2', title: 'Product 2', quantity: 2),
          //   CartItemModel(productId: '3', title: 'Product 3', quantity: 3),
          // ]);

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

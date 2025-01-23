import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_state.dart';
import 'package:t_store/features/shop/features/cart/presentation/widgets/cart_items.dart';
import 'package:t_store/features/shop/features/checkout/presentation/pages/checkout_page.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<CartCubit>(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            if (state.cartItems.isEmpty) {
              return Scaffold(
                appBar: _appBar(context),
                body: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceBtwItems,
                    vertical: AppSizes.defaultSpace,
                  ),
                  child: CartItems(),
                ),
              );
            }
            return Scaffold(
              bottomNavigationBar: _checkoutButton(context),
              appBar: _appBar(context),
              body: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceBtwItems,
                  vertical: AppSizes.defaultSpace,
                ),
                child: CartItems(),
              ),
            );
          }
          return Scaffold(
            bottomNavigationBar: _checkoutButton(context),
            appBar: _appBar(context),
            body: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spaceBtwItems,
                vertical: AppSizes.defaultSpace,
              ),
              child: CartItems(),
            ),
          );
        },
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
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.spaceBtwItems,
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

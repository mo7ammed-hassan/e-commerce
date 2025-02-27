import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/success_pages/success_page.dart';
import 'package:t_store/features/shop/features/cart/data/source/cart_managment_service.dart';
import 'package:t_store/features/shop/features/cart/presentation/widgets/cart_items.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/chekout_order_detial.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/coupon_field.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _checkoutButton(context),
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Column(
            children: [
              const CartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              const CouponFiled(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              ChekoutOrderDetial(
                subTotal: subTotal,
              ),
            ],
          ),
        ),
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
          // subTotal > 0 ?
          context.pushPage(
            SuccessPage(
              json: true,
              title: 'Payment Success!',
              subtitle: 'Your items will be shipping soon!',
              image: TImages.completeOrder,
              onPressed: () async {
                context.pushPage(const NavigationMenu());
                await getIt
                    .get<CartManagementService>()
                    .removeAllItemsFromCart();
              },
            ),
          );
        },
        child: const Text('Checkout \$300'),
      ),
    );
  }

  TAppBar _appBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        'Order Review',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.spaceBtwItems / 2,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkerGrey : AppColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                backgroundColor: AppColors.darkGrey,
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                color: AppColors.white,
                onPressed: () {},
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              // TODO: Quantity should get from the cart cubit
              Text(
                '1',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              TCircularIcon(
                backgroundColor: AppColors.black,
                icon: Iconsax.add,
                width: 40,
                height: 40,
                color: AppColors.white,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(width: AppSizes.spaceBtwSections),
          ElevatedButton(
            onPressed: () async {
              await getIt.get<CartCubit>().addProductToCart(
                  product: product,
                  quantity: getIt
                      .get<CartCubit>()
                      .getItemQuantity(productId: product.id));
              // await CartCubit().addProductToCart(product: product);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColors.black,
              side: const BorderSide(color: AppColors.black),
            ),
            child: const Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}

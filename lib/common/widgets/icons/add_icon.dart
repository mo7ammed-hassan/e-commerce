import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key, this.onTap, required this.product});
  final Function()? onTap;
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final cartCubit = getIt.get<CartCubit>();
    return InkWell(
      onTap: () async {
        await cartCubit.addProductToCart(product: product);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(TSizes.productImageRadius),
            topLeft: Radius.circular(TSizes.productImageRadius),
          ),
          color: AppColors.dark,
        ),
        child: const SizedBox(
          width: TSizes.iconLg * 1.2,
          height: TSizes.iconLg * 1.2,
          child: Center(
            child: Icon(
              Iconsax.add,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

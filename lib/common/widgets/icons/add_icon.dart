import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:t_store/features/shop/features/product_details/presentation/pages/product_detail_page.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key, this.onTap, required this.product});
  final Function()? onTap;
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final cartCubit = getIt.get<CartCubit>();
    return InkWell(
      onTap: () async {
        if (product.productType == ProductType.single.toString()) {
          await cartCubit.addProductToCart(product: product);
        } else {
          context.pushPage(ProductDetailPage(product: product));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppSizes.productImageRadius),
            topLeft: Radius.circular(AppSizes.productImageRadius),
          ),
          color: AppColors.dark,
        ),
        child: const SizedBox(
          width: AppSizes.iconLg * 1.2,
          height: AppSizes.iconLg * 1.2,
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

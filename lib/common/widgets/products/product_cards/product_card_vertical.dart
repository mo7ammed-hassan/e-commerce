import 'package:flutter/material.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/product_card_body.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/product_card_footer.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/product_card_header.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_cubit.dart';
import 'package:t_store/features/shop/features/product_details/presentation/pages/product_detail_page.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  final ProductEntity product;
  const TProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ProductsCubit productCubit = ProductsCubit();
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          boxShadow: [TShadowStyle.verticalProductShadow],
          color: isDark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TProductCardHeader(thumbnail: product.thumbnail ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            TProductCardBody(
              title: product.title,
              brandTitle: product.brand?.name ?? '',
            ),
            const Spacer(),
            TProductCartFooter(price: productCubit.getProductPrice(product)),
          ],
        ),
      ),
    );
  }
}

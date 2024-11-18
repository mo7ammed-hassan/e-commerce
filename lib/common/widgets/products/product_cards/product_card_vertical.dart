import 'package:flutter/material.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/product_card_body.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/product_card_footer.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/product_card_header.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          boxShadow: [TShadowStyle.verticalProductShadow],
          color: isDark ? TColors.darkerGrey : TColors.white,
        ),
        child: const Column(
          children: [
            TProductCardHeader(),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            TProductCardBody(),
            Spacer(),
            TProductCartFooter(),
          ],
        ),
      ),
    );
  }
}

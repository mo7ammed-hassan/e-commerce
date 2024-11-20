import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/discount_rate.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_price.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            TDiscountRate(rate: '25%'),
            SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: '250', isLarge: true),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            TProductPriceText(price: '200', lineThrough: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const TProductTitleText(
          title: 'Green Nike Sport Sneakers',
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(
              title: 'Status',
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const Row(
          children: [
            TCircularImage(image: TImages.nikeLogo),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            TBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}

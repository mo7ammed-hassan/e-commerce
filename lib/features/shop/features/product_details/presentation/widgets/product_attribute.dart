import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductAttrebute extends StatelessWidget {
  const TProductAttrebute({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: isDark ? TColors.darkGrey : TColors.grey,
      child: Row(
        children: [
          const TSectionHeading(
            title: 'Variation',
            showActionButton: false,
          ),
          const SizedBox(width: TSizes.spaceBtwSections),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TProductTitleText(
                    title: 'Price :',
                    smallSize: true,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  const TProductPriceText(
                    price: '40',
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    '\$ 53',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  const TProductTitleText(
                    title: 'Stock :',
                    smallSize: true,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    'In Stock',
                    style:
                        Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

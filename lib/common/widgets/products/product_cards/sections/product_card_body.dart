import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductCardBody extends StatelessWidget {
  const TProductCardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TProductTitleText(
            title: 'Green Nike Air Shose',
            smallSize: true,
          ),
          SizedBox(height: TSizes.spaceBtwItems / 2),
          TBrandTitleWithVerifiedIcon(title: 'Nike'),
        ],
      ),
    );
  }
}

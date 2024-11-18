import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          // Brand with Product Conunt
          TBrandCard(onTap: () {}, showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          //Brand Top 3 Product Image
          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: _topBrandImage(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _topBrandImage(BuildContext context) {
    return TRoundedContainer(
      height: 100,
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.darkerGrey
          : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      child: const Image(
        image: AssetImage(TImages.productImage1),
        fit: BoxFit.contain,
      ),
    );
  }
}

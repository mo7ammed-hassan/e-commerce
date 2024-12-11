import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/sections/discount_rate.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardHeader extends StatelessWidget {
  const TProductCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 180,
      width: 180,
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: isDark ? TColors.dark : TColors.light,
      child: Stack(
        children: [
          _productImage(),
          _discountText(context),
          _favoriteButton(),
        ],
      ),
    );
  }

  Widget _productImage() {
    return const Center(
      child: TRoundedImage(
        imageUrl: TImages.productImage1,
      ),
    );
  }

  Widget _favoriteButton() {
    return const Positioned(
      top: 0,
      right: 0,
      child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
    );
  }

  Widget _discountText(BuildContext context) {
    return const Positioned(
      top: 12,
      child: TDiscountRate(
        rate: '25%',
      ),
    );
  }
}

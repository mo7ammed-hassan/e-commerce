import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
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

  TRoundedImage _productImage() {
    return const TRoundedImage(
      imageUrl: TImages.productImage1,
    );
  }

  Positioned _favoriteButton() {
    return const Positioned(
      top: 0,
      right: 0,
      child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
    );
  }

  Positioned _discountText(BuildContext context) {
    return Positioned(
      top: 12,
      child: TRoundedContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.sm,
          vertical: TSizes.xs,
        ),
        radius: TSizes.sm,
        backgroundColor: TColors.secondary.withOpacity(0.8),
        child: Text(
          '25%',
          style: Theme.of(context).textTheme.labelLarge!.apply(
                color: TColors.black,
              ),
        ),
      ),
    );
  }
}

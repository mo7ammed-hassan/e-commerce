import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductQuantityButtons extends StatelessWidget {
  const TProductQuantityButtons({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          backgroundColor:
              isDark ? TColors.darkerGrey : TColors.light,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: isDark ? TColors.white : TColors.black,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          '3',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        const TCircularIcon(
          backgroundColor: TColors.primary,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
        ),
      ],
    );
  }
}

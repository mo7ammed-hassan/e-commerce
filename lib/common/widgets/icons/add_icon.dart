import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TAddIcon extends StatelessWidget {
  const TAddIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(TSizes.productImageRadius),
          topLeft: Radius.circular(TSizes.productImageRadius),
        ),
        color: TColors.dark,
      ),
      child: const SizedBox(
        width: TSizes.iconLg * 1.2,
        height: TSizes.iconLg * 1.2,
        child: Center(
          child: Icon(
            Iconsax.add,
            color: TColors.white,
          ),
        ),
      ),
    );
  }
}

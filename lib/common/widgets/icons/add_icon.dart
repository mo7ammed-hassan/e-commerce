import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TAddIcon extends StatelessWidget {
  const TAddIcon({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(TSizes.productImageRadius),
            topLeft: Radius.circular(TSizes.productImageRadius),
          ),
          color: AppColors.dark,
        ),
        child: const SizedBox(
          width: TSizes.iconLg * 1.2,
          height: TSizes.iconLg * 1.2,
          child: Center(
            child: Icon(
              Iconsax.add,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

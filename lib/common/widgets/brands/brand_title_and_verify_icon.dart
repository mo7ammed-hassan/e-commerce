import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandTitleAndVerifyIcon extends StatelessWidget {
  final String title;

  const BrandTitleAndVerifyIcon({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: TSizes.xs),
        const Icon(
          Iconsax.verify,
          color: TColors.primary,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
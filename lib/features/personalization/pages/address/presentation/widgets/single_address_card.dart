import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SingleAddressCard extends StatelessWidget {
  const SingleAddressCard({super.key, required this.isSelectedAddress});
  final bool isSelectedAddress;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      backgroundColor: isSelectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: isSelectedAddress
          ? Colors.transparent
          : isDark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              isSelectedAddress ? Iconsax.tick_circle5 : null,
              color: isSelectedAddress
                  ? isDark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Hassan',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2),
              Text(
                '+(20)1096493188',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: TSizes.sm / 2),
              Text(
                '82356 Timmy Coves, South Liana, Mine, 87665, EGY',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

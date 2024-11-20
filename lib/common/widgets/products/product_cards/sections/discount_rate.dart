import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TDiscountRate extends StatelessWidget {
  const TDiscountRate({
    super.key, required this.rate,
  });
  final String rate;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm,
        vertical: TSizes.xs,
      ),
      radius: TSizes.sm,
      backgroundColor: TColors.secondary.withOpacity(0.8),
      child: Text(
        rate,
        style: Theme.of(context).textTheme.labelLarge!.apply(
              color: TColors.black,
            ),
      ),
    );
  }
}

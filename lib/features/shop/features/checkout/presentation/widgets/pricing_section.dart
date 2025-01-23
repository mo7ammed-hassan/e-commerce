import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // or use Expanded
          children: [
            Text('Subtotal',
                style: Theme.of(context).textTheme.bodyMedium), // here
            Text('\$1478', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // or use Expanded
          children: [
            Text('Shipping Free',
                style: Theme.of(context).textTheme.bodyMedium), // here
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // or use Expanded
          children: [
            Text('Tax Free',
                style: Theme.of(context).textTheme.bodyMedium), // here
            Text('\$10.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // or use Expanded
          children: [
            Text('Order Total',
                style: Theme.of(context).textTheme.titleMedium), // here
            Text('\$10.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

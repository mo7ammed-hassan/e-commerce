import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({
    super.key,
    required this.subTotal,
  });
  final double subTotal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Free',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Free', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$10.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Text(
                'Order Total',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(width: AppSizes.md),
            FittedBox(
              child: Text(
                '\$${calcTotal()}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  double calcTotal() {
    return subTotal + 6.0 + 10.0;
  }
}

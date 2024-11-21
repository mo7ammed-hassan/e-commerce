import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/address_section.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/payment_section.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/pricing_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ChekoutOrderDetial extends StatelessWidget {
  const ChekoutOrderDetial({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: isDark ? TColors.black : TColors.white,
      child: const Column(
        children: [
          PricingSection(),
          SizedBox(height: TSizes.spaceBtwItems),
          Divider(),
          SizedBox(height: TSizes.spaceBtwItems),
          PaymentSection(),
          SizedBox(height: TSizes.spaceBtwItems * 2),
          AddressSection(),
        ],
      ),
    );
  }
}

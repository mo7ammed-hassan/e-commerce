import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/features/checkout/presentation/cubits/checkout_cubit.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/address/address_section.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/payment/payment_section.dart';
import 'package:t_store/features/shop/features/checkout/presentation/widgets/pricing_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ChekoutOrderDetial extends StatelessWidget {
  const ChekoutOrderDetial({super.key, required this.subTotal});
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => CheckoutCubit()..initPaymentMethod(),
      child: TRoundedContainer(
        padding: const EdgeInsets.all(AppSizes.md),
        showBorder: true,
        backgroundColor: isDark ? AppColors.black : AppColors.white,
        child: Column(
          children: [
            PricingSection(subTotal: subTotal),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const PaymentSection(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const AddressSection(),
          ],
        ),
      ),
    );
  }
}

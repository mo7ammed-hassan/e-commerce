import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        const TSectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedImage(
              width: 55,
              height: 30,
              backgroundColor: isDark ? AppColors.light : AppColors.white,
              imageUrl: TImages.visa,
              fit: BoxFit.contain,
              padding: const EdgeInsets.all(2),
              borderRadius: 5,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              'Visa',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}

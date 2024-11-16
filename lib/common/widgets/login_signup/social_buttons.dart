import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/login_signup/scocial_button.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TSocialButton(socialIcon: TImages.google),
        SizedBox(width: TSizes.spaceBtwItems),
        TSocialButton(socialIcon: TImages.facebook),
      ],
    );
  }
}

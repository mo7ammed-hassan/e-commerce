import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSocialButton extends StatelessWidget {
  final String socialIcon;
  const TSocialButton({
    super.key,
    required this.socialIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image(
          width: TSizes.iconLg,
          height: TSizes.iconLg,
          image: AssetImage(socialIcon),
        ),
      ),
    );
  }
}

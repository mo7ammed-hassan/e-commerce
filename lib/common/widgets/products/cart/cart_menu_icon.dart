import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? iconColor;
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor ?? (isDark ? TColors.white : TColors.black),
          ),
          onPressed: onPressed,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: TColors.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

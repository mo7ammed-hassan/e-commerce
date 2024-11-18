import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/icons/add_icon.dart';
import 'package:t_store/common/widgets/texts/product_price.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductCartFooter extends StatelessWidget {
  const TProductCartFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: TSizes.sm),
          child: TProductPriceText(price: '35.0', isLarge: true),
        ),
        TAddIcon(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/icons/add_icon.dart';
import 'package:t_store/common/widgets/texts/product_price.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductCartFooter extends StatelessWidget {
  const TProductCartFooter({
    super.key,
    this.price,
  });
  final double? price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: TSizes.sm),
          child: TProductPriceText(price: price.toString(), isLarge: true),
        ),
        const TAddIcon(),
      ],
    );
  }
}

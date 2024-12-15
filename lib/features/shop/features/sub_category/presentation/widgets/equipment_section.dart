import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizantal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class EquipmentSection extends StatelessWidget {
  const EquipmentSection({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: title,
          onPressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ProductCardHorizantal(product: ProductModel.empty().toEntity()),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: TSizes.spaceBtwItems),
          ),
        ),
      ],
    );
  }
}

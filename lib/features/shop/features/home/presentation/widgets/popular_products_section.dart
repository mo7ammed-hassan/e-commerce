import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/all_products/presentation/pages/all_products_page.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Popular Products',
          onPressed: () {
            context.pushPage(const AllProductsPage());
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        TGridLayout(
          itemCount: 4,
          itemBuilder: (context, index) => const TProductCardVertical(),
        ),
      ],
    );
  }
}

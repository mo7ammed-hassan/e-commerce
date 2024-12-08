import 'package:flutter/material.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/popular_products_section.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/slider/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeBodySection extends StatelessWidget {
  const HomeBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.spaceBtwItems,
        vertical: TSizes.defaultSpace,
      ),
      child: Column(
        children: [
          TPromoSlider(),
          SizedBox(height: TSizes.spaceBtwSections),
          PopularProductsSection(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_conatiner.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/categories/categories_sections.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderConatiner(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections / 2),
                  TSearchConatiner(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  CategoriesSection(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.spaceBtwItems),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'Popular Products', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        const TProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

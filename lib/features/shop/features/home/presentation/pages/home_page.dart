import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/categories/categories_sections.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/home_app_bar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_conatiner.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderConatiner(
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
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TProductCardHorizontal(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

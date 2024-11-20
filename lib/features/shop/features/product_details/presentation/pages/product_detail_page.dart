import 'package:flutter/material.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/product_attribute.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/rating_and_share.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductDetailImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // -Rating & Share
                  const TRatingAndShare(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // - Price, Title, Stock, Brand
                  const TProductMetaData(),
                  // - Attributes
                  TProductAttributes(isDark: isDark),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // - Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),

                  // -- Description

                  // Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/product_reviews/presentation/pages/product_review_page.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/bottom_add_to_cart.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/product_attribute.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/rating_and_share.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductDetailImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: TSizes.defaultSpace,
                right: TSizes.spaceBtwItems,
                left: TSizes.spaceBtwItems,
              ),
              child: Column(
                children: [
                  // -Rating & Share
                  const TRatingAndShare(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // - Price, Title, Stock, Brand
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),
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
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // -- Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for blue Nike Sleeve less vest. there are more things that can be added to this description',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews (175)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductReviewPage(),
                            ),
                          );
                        },
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
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

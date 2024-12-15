import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widgets.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductDetailImageSlider extends StatelessWidget {
  final ProductEntity product;
  const TProductDetailImageSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Image(
                    image: AssetImage(product.thumbnail),
                  ),
                ),
              ),
            ),
            // Image Slider
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TRoundedImage(
                      width: 80,
                      padding: const EdgeInsets.all(TSizes.xs),
                      imageUrl: product.images[index],
                      backgroundColor: isDark ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

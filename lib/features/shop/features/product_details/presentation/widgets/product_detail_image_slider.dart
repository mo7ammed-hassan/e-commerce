import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widgets.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductDetailImageSlider extends StatelessWidget {
  const TProductDetailImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Image(
                    image: AssetImage(TImages.productImage1),
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
                  itemCount: 5,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TRoundedImage(
                      width: 80,
                      padding: const EdgeInsets.all(TSizes.xs),
                      imageUrl: TImages.productImage10,
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
              showArrowBack: true,
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

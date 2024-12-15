import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widgets.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/images_product_cubit.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductDetailImageSlider extends StatelessWidget {
  final ProductEntity product;
  const TProductDetailImageSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return BlocProvider(
      create: (_) => ImagesProductCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ImagesProductCubit>();
          final images = cubit.getAllProductImages(product);

          return TCurvedEdgeWidget(
            child: Container(
              color: isDark ? TColors.darkerGrey : TColors.light,
              child: Stack(
                children: [
                  // Main image display
                  BlocBuilder<ImagesProductCubit, String>(
                    builder: (context, selectedImage) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                TSizes.productImageRadius * 2),
                            child: GestureDetector(
                              onTap: () => cubit.showEnlargedImage(
                                  selectedImage, context),
                              child: Image(
                                image: AssetImage(selectedImage.isEmpty
                                    ? product.thumbnail
                                    : selectedImage),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
                        itemCount: images.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final image = images[index];
                          return BlocBuilder<ImagesProductCubit, String>(
                            builder: (context, selectedImage) {
                              return GestureDetector(
                                onTap: () => cubit.selectImage(image),
                                child: TRoundedImage(
                                  width: 80,
                                  padding: const EdgeInsets.all(TSizes.xs),
                                  imageUrl: image,
                                  backgroundColor:
                                      isDark ? TColors.dark : TColors.white,
                                  border: Border.all(
                                    color: selectedImage == image
                                        ? TColors.primary
                                        : TColors.grey,
                                    width: 2,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: TSizes.spaceBtwItems),
                      ),
                    ),
                  ),

                  // App Bar
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
        },
      ),
    );
  }
}

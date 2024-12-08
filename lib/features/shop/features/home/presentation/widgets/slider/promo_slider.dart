import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_slider.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/banner/banner_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/home/promo_slider/promo_slider_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/slider/promo_carousel.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/slider/promo_slider_indicators.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  static const List<String> banners = [
    TImages.promoBanner1,
    TImages.promoBanner2,
    TImages.promoBanner3
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PromoSliderCubit(),
        ),
        BlocProvider(
          create: (context) => BannerCubit(),
        ),
      ],
      child: BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          if (state is BannerLoadedState) {
            // final List<BannerEntity> banners = state.allBanners;
            // return Column(
            //   children: [
            //     const TPromoCarousel(),
            //     const SizedBox(height: TSizes.spaceBtwItems),
            //     TPromoSliderIndicators(length: banners.length),
            //   ],
            // );

            return Column(
              children: [
                const TPromoCarousel(banners: banners),
                const SizedBox(height: TSizes.spaceBtwItems),
                TPromoSliderIndicators(length: banners.length),
              ],
            );
          }
          return const ShimmerSlider();
        },
      ),
    );
  }
}

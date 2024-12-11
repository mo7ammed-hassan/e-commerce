import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/features/shop/features/home/data/models/banner_model.dart';
import 'package:t_store/features/shop/features/home/domain/entites/banner_entity.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/banner/banner_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/home/promo_slider/promo_slider_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/slider/promo_carousel.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/slider/promo_slider_indicators.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

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
            final List<BannerEntity> banners = state.allBanners;
            return Column(
              children: [
                TPromoCarousel(banners: banners),
                const SizedBox(height: TSizes.spaceBtwItems),
                TPromoSliderIndicators(length: banners.length),
              ],
            );
          }
          // return const ShimmerSlider();
          return Skeletonizer(
            child: Column(
              children: [
                TPromoCarousel(
                  isLoading: true,
                  banners: [
                    BannerModel.empty().toEntity(),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TPromoSliderIndicators(length: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}

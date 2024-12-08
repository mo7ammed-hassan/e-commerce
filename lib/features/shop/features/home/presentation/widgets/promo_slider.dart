import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/home/promo_slider/promo_slider_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/promo_carousel.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/promo_slider_indicators.dart';
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
    return BlocProvider(
      create: (context) => PromoSliderCubit(),
      child: Column(
        children: [
          const TPromoCarousel(banners: banners),
          const SizedBox(height: TSizes.spaceBtwItems),
          TPromoSliderIndicators(length: banners.length),
        ],
      ),
    );
  }
}

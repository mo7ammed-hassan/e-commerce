import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/home/presentation/manger/cubits/promo_slider/promo_slider_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/promo_carousel.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/promo_slider_indicators.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  final List<String> banners;
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PromoSliderCubit(),
      child: Column(
        children: [
          TPromoCarousel(
            banners: banners,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          TPromoSliderIndicators(length: banners.length),
        ],
      ),
    );
  }
}

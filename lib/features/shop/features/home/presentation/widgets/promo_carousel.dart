import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/features/shop/features/home/presentation/manger/cubits/promo_slider/promo_slider_cubit.dart';

class TPromoCarousel extends StatelessWidget {
  final List<String> banners;
  const TPromoCarousel({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        onPageChanged: (index, _) =>
            context.read<PromoSliderCubit>().updatePageIndicator(index),
      ),
    );
  }
}

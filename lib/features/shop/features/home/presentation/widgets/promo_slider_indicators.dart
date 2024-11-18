import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/animated_circular_container.dart';
import 'package:t_store/features/shop/features/home/presentation/manger/cubits/promo_slider/promo_slider_cubit.dart';
import 'package:t_store/utils/constants/colors.dart';

class TPromoSliderIndicators extends StatelessWidget {
  final int length;
  const TPromoSliderIndicators({
    super.key,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoSliderCubit, int>(
      builder: (context, state) {
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              length,
              (index) => TAnimatedCircularConatiner(
                width: state == index ? 35 : 20,
                height: 4,
                margin: const EdgeInsets.only(right: 10),
                backgroundColor:
                    state == index ? TColors.primary : TColors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}

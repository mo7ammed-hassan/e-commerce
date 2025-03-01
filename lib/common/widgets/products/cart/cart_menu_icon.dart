import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_state.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? iconColor;
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = getIt.get<CartCubit>()..fetchCartItems();
    final isDark = HelperFunctions.isDarkMode(context);
    return BlocProvider.value(
      value: cartCubit,
      child: Stack(
        children: [
          IconButton(
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor ?? (isDark ? AppColors.white : AppColors.black),
            ),
            onPressed: onPressed,
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      cartCubit.totalCartItems.toString(),
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: AppColors.white,
                            fontSizeFactor: 0.8,
                          ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

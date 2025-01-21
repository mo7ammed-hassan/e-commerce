import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/features/shop/features/cart/domain/entities/cart_item_entity.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductQuantityButtons extends StatelessWidget {
  const TProductQuantityButtons({
    super.key,
    required this.isDark,
    required this.cartItem,
  });

  final bool isDark;
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: isDark ? TColors.white : TColors.black,
          onPressed: () {
             context.read<CartCubit>().removeSingleCartItem(cartItem: cartItem);
          },
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          cartItem.quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          backgroundColor: TColors.primary,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          onPressed: () {
            //context.read<CartCubit>().addSingleCartItem(cartItem: cartItem);
          },
        ),
      ],
    );
  }
}

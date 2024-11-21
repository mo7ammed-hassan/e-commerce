import 'package:flutter/material.dart';
import 'package:t_store/features/shop/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          CartItemCard(showAddRemoveButtons: showAddRemoveButtons),
      separatorBuilder: (context, index) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
    );
  }
}

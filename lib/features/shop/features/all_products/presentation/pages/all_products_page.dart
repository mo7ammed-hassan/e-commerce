import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwItems,
            vertical: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              _dropdownField(),
              const SizedBox(height: TSizes.spaceBtwSections),
              _allProductsList()
            ],
          ),
        ),
      ),
    );
  }

  TAppBar _appBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        'Popular Products',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  TGridLayout _allProductsList() {
    return TGridLayout(
      itemCount: 10,
      itemBuilder: (context, index) => const TProductCardVertical(),
    );
  }

  DropdownButtonFormField<String> _dropdownField() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
      items: [
        'Name',
        'Higher Price',
        'Lower Price',
        'Sale',
        'Newest',
        'Popularity'
      ]
          .map(
            (option) => DropdownMenuItem(
              value: option,
              child: Text(option),
            ),
          )
          .toList(),
      onChanged: (value) {},
    );
  }
}

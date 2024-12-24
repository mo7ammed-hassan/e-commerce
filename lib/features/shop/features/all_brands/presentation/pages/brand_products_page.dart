import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProductsPage extends StatelessWidget {
  const BrandProductsPage({super.key});

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
              TBrandCard(brand: BrandEntity.empty()),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSectionHeading(title: 'Products', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSortableProducts(
                products: [],
              ),
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
        'Brand',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

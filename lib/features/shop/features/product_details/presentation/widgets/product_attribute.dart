import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_attribute_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/product_details/presentation/cubits/product_variation_cubit.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/build_choice_chips.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/variation_details.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  final ProductEntity product;
  const TProductAttributes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<ProductVariationCubit>();

    return BlocProvider.value(
      value: cubit..initializeWithDefault(product),
      child: Column(
        children: [
          const VariationDetails(),
          const SizedBox(height: AppSizes.spaceBtwItems),
          _buildAttributesList(context),
        ],
      ),
    );
  }

  // This method builds the list of attributes from the product
  Widget _buildAttributesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.productAttributes.asMap().entries.map((attribute) {
        return _buildAttributeSection(context, attribute);
      }).toList(),
    );
  }

  // This method builds each individual attribute section
  Widget _buildAttributeSection(
      BuildContext context, MapEntry<int, ProductAttributeEntity> attribute) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (attribute.key.isOdd) const SizedBox(height: AppSizes.spaceBtwItems),
        TSectionHeading(
          title: attribute.value.name,
          showActionButton: false,
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        BuildChoiceChips(attribute: attribute, product: product),
      ],
    );
  }
}

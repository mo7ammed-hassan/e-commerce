import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/sortable_product_cubit.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'sortable_dropdown.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortableProductCubit()..resetProducts(products),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              SortableDropdown(
                initialValue: context.read<SortableProductCubit>().sortOption,
                onChanged: (value) => context
                    .read<SortableProductCubit>()
                    .sortProducts(value.toString()),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              BlocBuilder<SortableProductCubit, List<ProductEntity>>(
                builder: (context, state) {
                  return TGridLayout(
                    itemCount: state.length,
                    itemBuilder: (context, index) => TProductCardVertical(
                      product: state[index],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

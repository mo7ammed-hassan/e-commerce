import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_cubit.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_state.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProductsCubit>().fetchAllProducts();
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsFailureState) {
          return _errorWidget(state.allProductsError!);
        } else if (state is ProductsLoadedState) {
          return TGridLayout(
            itemCount: state.allProducts.length,
            itemBuilder: (context, index) => TProductCardVertical(
              product: state.allProducts[index],
            ),
          );
        } else {
          return _loadingWidget();
        }
      },
    );
  }

  Widget _loadingWidget() {
    return Skeletonizer(
      enabled: true,
      child: TGridLayout(
        itemCount: 4,
        itemBuilder: (p0, p1) => TProductCardVertical(
          product: ProductModel.empty().toEntity(),
        ),
      ),
    );
  }

  Widget _errorWidget(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }
}

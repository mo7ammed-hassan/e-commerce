import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_cubit.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_state.dart';

class FeaturedProductSection extends StatefulWidget {
  const FeaturedProductSection({
    super.key,
  });

  @override
  State<FeaturedProductSection> createState() => _FeaturedProductSectionState();
}

class _FeaturedProductSectionState extends State<FeaturedProductSection> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().fetchFeaturedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is FeaturedProductsFailureState) {
          return _errorWidget(state.errorMessage);
        } else if (state is FeaturedProductsLoadedState) {
          return TGridLayout(
            itemCount: state.featuredProducts.length,
            itemBuilder: (context, index) => TProductCardVertical(
              product: state.featuredProducts[index],
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

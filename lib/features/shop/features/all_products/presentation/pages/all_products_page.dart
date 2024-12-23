import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/all_product_cubit.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/all_products_state.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({
    super.key,
    required this.products,
    required this.useCase,
    required this.title,
  });
  final List<ProductEntity> products;
  final UseCases useCase;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllProductsCubit()..fetchAllProducts(useCase: useCase),
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.spaceBtwItems,
              vertical: TSizes.defaultSpace,
            ),
            child: BlocBuilder<AllProductsCubit, AllProductsState>(
              builder: (context, state) {
                if (state is AllProductsLoadingState) {
                  return _loadingWidget();
                }
                if (state is AllProductsLoadedState) {
                  return TSortableProducts(
                    products: state.products ?? products,
                  );
                }
                if (state is AllProductsFailureState) {
                  return Center(
                    child: Text('Error: ${state.error}'),
                  );
                } else {
                  return const Center(child: Text('No products found.'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  TAppBar _appBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      leadingOnPressed: () {
        AllProductsCubit().close();
      },
    );
  }

  Widget _loadingWidget() {
    return Skeletonizer(
      enabled: true,
      child: TGridLayout(
        itemCount: 6,
        itemBuilder: (p0, p1) => TProductCardVertical(
          product: ProductModel.empty().toEntity(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_cubit.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_state.dart';
import 'package:t_store/features/shop/features/all_products/presentation/pages/all_products_page.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Popular Products',
          onPressed: () {
            context.pushPage(const AllProductsPage());
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is FeaturedProductsFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is FeaturedProductsLoadedState) {
              return TGridLayout(
                itemCount: state.featuredProducts.length,
                itemBuilder: (context, index) => TProductCardVertical(
                  product: state.featuredProducts[index],
                ),
              );
            } else {
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
          },
        ),
      ],
    );
  }
}

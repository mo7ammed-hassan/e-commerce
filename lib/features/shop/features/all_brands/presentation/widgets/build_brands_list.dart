import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/animation_containers/open_container_wrapper.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/features/shop/features/all_brands/presentation/cubits/brand_cubit.dart';
import 'package:t_store/features/shop/features/all_brands/presentation/cubits/brand_state.dart';
import 'package:t_store/features/shop/features/all_brands/presentation/pages/brand_products_page.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BuildBrandsList extends StatelessWidget {
  const BuildBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    final brandCubit = getIt.get<BrandCubit>();
    return BlocProvider(
      create: (context) => brandCubit..fetchAllBrands(),
      child: BlocBuilder<BrandCubit, BrandState>(
        builder: (context, state) {
          if (state is BrandLoading) {
            return _loadingBrandsList();
          }

          if (state is BrandError) {
            return Center(child: Text(state.allBrandsMessage!));
          }

          if (state is BrandLoaded) {
            if (state.allbrands.isEmpty) {
              return const Center(child: Text('No brands found!'));
            }

            return _buildBrandsListItems(state.allbrands);
          }

          return const Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }

  TGridLayout _buildBrandsListItems(List<BrandEntity> brands) {
    return TGridLayout(
      itemCount: brands.length,
      mainAxisExtent: 80,
      itemBuilder: (context, index) => OpenContainerWrapper(
        nextScreen: BrandProductsPage(
          brand: brands[index],
        ),
        radius: const Radius.circular(TSizes.cardRadiusLg),
        child: TBrandCard(
          brand: brands[index],
        ),
      ),
    );
  }

  Widget _loadingBrandsList() {
    return Skeletonizer(
      child: _buildBrandsListItems(
        List.generate(
          12,
          (index) => BrandEntity.empty(),
        ),
      ),
    );
  }
}

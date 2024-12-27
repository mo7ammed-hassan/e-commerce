import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/features/shop/features/store/presentation/cubits/store_cubit.dart';
import 'package:t_store/features/shop/features/store/presentation/cubits/store_state.dart';

class BuildBrandList extends StatelessWidget {
  final String categoryId;
  const BuildBrandList({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    context
        .read<StoreCubit>()
        .fetchBrandsSpecificCategory(categoryId: categoryId);
    return BlocBuilder<StoreCubit, StoreState>(
      buildWhen: (previous, current) {
        if (current is StoreBrandLoaded ||
            current is StoreBrandError ||
            current is StoreBrandLoading) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is StoreBrandLoading) {
          return _loadingBrandsList();
        }

        if (state is StoreBrandError) {
          return Center(
            child: Text(state.error),
          );
        }

        if (state is StoreBrandLoaded) {
          if (state.brands.isEmpty) {
            return const Center(child: Text('No brands found!'));
          }

          return _buildBrandsListItems(state.brands);
        }

        return const Center(child: Text('Something went wrong!'));
      },
    );
  }

  Widget _buildBrandsListItems(List<BrandEntity> brands) {
    return Column(
      children: brands.map((brand) => TBrandShowcase(brand: brand)).toList(),
    );
  }

  Widget _loadingBrandsList() {
    return Skeletonizer(
      child: TBrandShowcase(brand: BrandEntity.empty()),
    );
  }
}

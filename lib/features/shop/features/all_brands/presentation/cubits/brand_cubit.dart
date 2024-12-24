import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/features/shop/features/all_brands/domain/usecases/get_all_brands_use_case.dart';
import 'package:t_store/features/shop/features/all_brands/domain/usecases/get_featured_brands_use_case.dart';
import 'package:t_store/features/shop/features/all_brands/presentation/cubits/brand_state.dart';
import 'package:t_store/service_locator.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit() : super(BrandInitial());

  final List<BrandEntity> featuredBrands = [];
  final List<BrandEntity> allBrands = [];

  // --flag to check if the brands are already loaded--
  bool isAllBrandsLoaded = false;
  bool isFeaturedBrandsLoaded = false;

  // -- Get Featured Brands --
  Future<void> fetchFeaturedBrands() async {
    if (isFeaturedBrandsLoaded) return;

    emit(BrandLoading());

    var result = await getIt.get<GetFeaturedBrandsUseCase>().call(params: 4);

    result.fold(
      (error) => emit(
        BrandError(message: error),
      ),
      (brands) {
        featuredBrands.clear();
        featuredBrands.addAll(brands);
        if (kDebugMode) {
          print('Featured Brands: Success');
        }
        isFeaturedBrandsLoaded = true;
        emit(BrandLoaded(brands: brands));
      },
    );
  }

  // -- Get All Brands --
  Future<void> fetchAllBrands() async {
    if (isAllBrandsLoaded) return;

    emit(BrandLoading());

    var result = await getIt.get<GetAllBrandsUseCase>().call(params: 16);

    result.fold(
      (error) => emit(
        BrandError(message: error),
      ),
      (brands) {
        allBrands.clear();
        allBrands.addAll(brands);
        if (kDebugMode) {
          print('All Brands: Success');
        }
        isAllBrandsLoaded = true;
        emit(BrandLoaded(brands: brands));
      },
    );
  }

  void refreshBrands() {
    isAllBrandsLoaded = false;
    isFeaturedBrandsLoaded = false;
    fetchAllBrands();
    fetchFeaturedBrands();
  }
}

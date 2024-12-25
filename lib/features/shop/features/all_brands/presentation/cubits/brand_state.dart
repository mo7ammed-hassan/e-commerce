import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';

abstract class BrandState {
  const BrandState();
}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {
  final bool isLoadingAllBrands;
  final bool isLoadingFeaturedBrands;

  BrandLoading({
    this.isLoadingAllBrands = false,
    this.isLoadingFeaturedBrands = false,
  });
}

class BrandLoaded extends BrandState {
  final List<BrandEntity> allbrands;
  final List<BrandEntity> featuredBrands;

  BrandLoaded({
    required this.allbrands,
    required this.featuredBrands,
  });
}

class BrandError extends BrandState {
  final String? allBrandsMessage;
  final String? featuredBrandsMessage;

  BrandError({
    this.allBrandsMessage,
    this.featuredBrandsMessage,
  });
}

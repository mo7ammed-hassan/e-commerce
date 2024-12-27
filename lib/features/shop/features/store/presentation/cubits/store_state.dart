import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreBrandLoading extends StoreState {}

class StoreBrandLoaded extends StoreState {
  final List<BrandEntity> brands;

  StoreBrandLoaded({required this.brands});
}

class StoreBrandError extends StoreState {
  final String error;

  StoreBrandError({required this.error});
}

// product

class StoreProductLoading extends StoreState {}

class StoreProductLoaded extends StoreState {
  final List<ProductEntity> products;

  StoreProductLoaded({required this.products});
}

class StoreProductError extends StoreState {
  final String error;

  StoreProductError({required this.error});
}

class StoreProductSpecificBrandLoading extends StoreState {}

class StoreProductSpecificBrandLoaded extends StoreState {
  final List<ProductEntity> products;

  StoreProductSpecificBrandLoaded({required this.products});
}

class StoreProductSpecificBrandError extends StoreState {
  final String error;

  StoreProductSpecificBrandError({required this.error});
}

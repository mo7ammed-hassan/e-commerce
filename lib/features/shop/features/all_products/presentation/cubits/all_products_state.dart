import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class AllProductsState {}

class AllProductsInitialState extends AllProductsState {}

class AllProductsLoadingState extends AllProductsState {}

// Unified loaded state for all products or featured products
class AllProductsLoadedState extends AllProductsState {
  final List<ProductEntity>? products;

  AllProductsLoadedState(this.products);
}

// Unified failure state for both
class AllProductsFailureState extends AllProductsState {
  final String? error;

  AllProductsFailureState({this.error});
}

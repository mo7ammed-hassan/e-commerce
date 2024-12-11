import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class ProductsState {}
class ProductsInitialState extends ProductsState{}

class FeaturedProductsLoadedState extends ProductsState {
  final List<ProductEntity> featuredProducts;

  FeaturedProductsLoadedState(this.featuredProducts);
}

class FeaturedProductsLoadingState extends ProductsState {}

class FeaturedProductsFailureState extends ProductsState {
  final String errorMessage;

  FeaturedProductsFailureState(this.errorMessage);
}

// state of all products
class AllProductsLoadingState extends ProductsState {}

class AllProductsLoadedState extends ProductsState {
  final List<ProductEntity> allProducts;

  AllProductsLoadedState(this.allProducts);
}

class AllProductsFailureState extends ProductsState {
  final String errorMessage;

  AllProductsFailureState(this.errorMessage);
}

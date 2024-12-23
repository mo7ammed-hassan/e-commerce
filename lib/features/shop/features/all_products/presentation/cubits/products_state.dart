import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {
  final bool isLoadingAllProducts;
  final bool isLoadingFeaturedProducts;

  ProductsLoadingState({
    this.isLoadingAllProducts = false,
    this.isLoadingFeaturedProducts = false,
  });
}

// Unified loaded state for all products or featured products
class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> allProducts;
  final List<ProductEntity> featuredProducts;

  ProductsLoadedState(
    this.allProducts,
    this.featuredProducts,
  );
}

// Unified failure state for both
class ProductsFailureState extends ProductsState {
  final String? allProductsError;
  final String? featuredProductsError;

  ProductsFailureState({
    this.allProductsError,
    this.featuredProductsError,
  });
}





// old states

// abstract class ProductsState {}
// class ProductsInitialState extends ProductsState{}

// class FeaturedProductsLoadedState extends ProductsState {
//   final List<ProductEntity> featuredProducts;

//   FeaturedProductsLoadedState(this.featuredProducts);
// }

// class FeaturedProductsLoadingState extends ProductsState {}

// class FeaturedProductsFailureState extends ProductsState {
//   final String errorMessage;

//   FeaturedProductsFailureState(this.errorMessage);
// }

// // state of all products
// class AllProductsLoadingState extends ProductsState {}

// class AllProductsLoadedState extends ProductsState {
//   final List<ProductEntity> allProducts;

//   AllProductsLoadedState(this.allProducts);
// }

// class AllProductsFailureState extends ProductsState {
//   final String errorMessage;

//   AllProductsFailureState(this.errorMessage);
// }
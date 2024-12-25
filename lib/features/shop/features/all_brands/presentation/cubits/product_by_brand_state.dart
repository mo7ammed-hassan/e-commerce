import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class ProductsByBrandState {}

class ProductsByBrandInitialState extends ProductsByBrandState {}

class ProductsByBrandLoadingState extends ProductsByBrandState {}

class ProductsByBrandLoadedState extends ProductsByBrandState {
  final List<ProductEntity> products;

  ProductsByBrandLoadedState({required this.products});
}

class ProductsByBrandErrorState extends ProductsByBrandState {
  final String message;

  ProductsByBrandErrorState({required this.message});
}

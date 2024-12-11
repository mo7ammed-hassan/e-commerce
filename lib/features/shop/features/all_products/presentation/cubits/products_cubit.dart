import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_all_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_fetured_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_state.dart';
import 'package:t_store/service_locator.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  final List<ProductEntity> allProducts = [];

  void fetchAllProducts() async {
    emit(AllProductsLoadingState());

    var result = await getIt<GetAllProductsUseCase>().call();

    result.fold(
      (error) {
        emit(AllProductsFailureState(error));
      },
      (products) {
        allProducts.clear();
        allProducts.addAll(products);
        emit(AllProductsLoadedState(products));
      },
    );
  }

  void fetchFeaturedProducts() async {
    emit(FeaturedProductsLoadingState());

    var result = await getIt<GetFeturedProductsUseCase>().call();

    result.fold(
      (error) {
        emit(FeaturedProductsFailureState(error));
      },
      (products) {
        allProducts.clear();
        allProducts.addAll(products);
        emit(FeaturedProductsLoadedState(products));
      },
    );
  }

  void refreshProducts() {
    fetchAllProducts();
    fetchFeaturedProducts();
  }
}

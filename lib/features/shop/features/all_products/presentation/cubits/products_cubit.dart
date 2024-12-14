import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_all_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_fetured_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_state.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/enums.dart';

class ProductsCubit extends Cubit<ProductsState> {
  static final ProductsCubit _singleton = ProductsCubit._internal();

  factory ProductsCubit() => _singleton;

  ProductsCubit._internal() : super(ProductsInitialState());

  final List<ProductEntity> allProducts = [];
  final List<ProductEntity> feturedProducts = [];
  bool _hasFetched = false;

  Future<void> fetchAllProducts() async {
    if (_hasFetched && allProducts.isNotEmpty) {
      if (kDebugMode) {
        print("Categories already fetched, no need to fetch again.");
      }
      return;
    }

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
        _hasFetched = true;
      },
    );
  }

  Future<void> fetchFeaturedProducts() async {
    if (_hasFetched && feturedProducts.isNotEmpty) {
      if (kDebugMode) {
        print("Categories already fetched, no need to fetch again.");
      }
      return;
    }

    emit(FeaturedProductsLoadingState());

    var result = await getIt<GetFeturedProductsUseCase>().call();

    result.fold(
      (error) {
        emit(FeaturedProductsFailureState(error));
      },
      (products) {
        feturedProducts.clear();
        feturedProducts.addAll(products);
        emit(FeaturedProductsLoadedState(products));
        _hasFetched = true;
      },
    );
  }

  // calulate product price ..
  String getProductPrice(ProductEntity product) {
    double smllestPrice = double.infinity;
    double largePrice = 0;
    // if have a sale price ..
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice! > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations) {
        double priceToConsider =
            (variation.salePrice > 0.0) ? variation.salePrice : variation.price;

        if (priceToConsider < smllestPrice) {
          smllestPrice = priceToConsider;
        }

        if (priceToConsider > largePrice) {
          largePrice = priceToConsider;
        }
      }
      if (smllestPrice == largePrice) {
        return largePrice.toString();
      } else {
        return '${smllestPrice.toString()} - ${largePrice.toString()}';
      }
    }
  }

  // calculate product discount..
  String? calculateProductDiscount(double originalPrice, double salePrice) {
    if (salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    return percentage.toStringAsFixed(0);
  }

  void refreshProducts() async {
    _hasFetched = false;
    await fetchAllProducts();
    await fetchFeaturedProducts();
  }

  @override
  Future<void> close() {
    if (kDebugMode) {
      print('Products cubit closed');
    }
    return super.close();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_all_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/domain/usecases/get_fetured_products_use_case.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_state.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/enums.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  final List<ProductEntity> allProducts = [];
  final List<ProductEntity> featuredProducts = [];

  bool _hasFetchedAllProducts = false;
  bool _hasFetchedFeaturedProducts = false;

  Future<void> fetchAllProducts({bool forceRefresh = false}) async {
    if (!forceRefresh && _hasFetchedAllProducts && allProducts.isNotEmpty) {
      if (kDebugMode) {
        print('Products Already fetched');
      }
      return;
    }

    emit(
      ProductsLoadingState(
        isLoadingAllProducts: true,
      ),
    );

    var result = await getIt<GetAllProductsUseCase>().call();

    result.fold(
      (error) {
        emit(ProductsFailureState(allProductsError: error));
      },
      (products) {
        allProducts.clear();
        allProducts.addAll(products);

        emit(ProductsLoadedState(allProducts, featuredProducts));
        _hasFetchedAllProducts = true;
      },
    );
  }

  Future<void> fetchFeaturedProducts({bool forceRefresh = false}) async {
    if (!forceRefresh &&
        _hasFetchedFeaturedProducts &&
        featuredProducts.isNotEmpty) {
      return;
    }

    emit(
      ProductsLoadingState(
        isLoadingFeaturedProducts: true,
      ),
    );

    var result = await getIt<GetFeturedProductsUseCase>().call();

    result.fold(
      (error) {
        emit(ProductsFailureState(featuredProductsError: error));
      },
      (products) {
        featuredProducts.clear();
        featuredProducts.addAll(products);

        emit(ProductsLoadedState(allProducts, featuredProducts));
        _hasFetchedFeaturedProducts = true;
      },
    );
  }

  Future<void> fetchInitialData() async {
    emit(
      ProductsLoadingState(
        isLoadingAllProducts: true,
        isLoadingFeaturedProducts: true,
      ),
    );

    await Future.wait([
      fetchAllProducts(forceRefresh: true).catchError((_) {}),
      fetchFeaturedProducts(forceRefresh: true).catchError((_) {}),
    ]);
  }

  Future<void> refreshProducts() async {
    _hasFetchedFeaturedProducts = false;
    _hasFetchedAllProducts = false;
    allProducts.clear();
    featuredProducts.clear();
    await fetchAllProducts(forceRefresh: true);
    await fetchFeaturedProducts(forceRefresh: true);
  }

  @override
  Future<void> close() {
    if (kDebugMode) {
      print('Products cubit closed');
    }
    return super.close();
  }

  String getProductPrice(ProductEntity product) {
    if (product.productType == ProductType.single.toString()) {
      double price = (product.salePrice != null && product.salePrice! > 0)
          ? product.salePrice!
          : product.price.toDouble();
      return price.toDouble().toString();
    }

    double smallestPrice = double.infinity;
    double largestPrice = 0;

    for (var variation in product.productVariations!) {
      double priceToConsider =
          (variation.salePrice > 0.0) ? variation.salePrice : variation.price;

      if (priceToConsider < smallestPrice) {
        smallestPrice = priceToConsider;
      }
      if (priceToConsider > largestPrice) {
        largestPrice = priceToConsider;
      }
    }

    return smallestPrice == largestPrice
        ? largestPrice.toString()
        : '$smallestPrice - $largestPrice';
  }

  String? calculateProductDiscount(double originalPrice, double salePrice) {
    if (salePrice <= 0.0 || originalPrice <= 0.0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getPrroductStockStatus(int stock) {
    return stock > 0 ? 'In stock' : 'Out stock';
  }
}





// old version

// class ProductsCubit extends Cubit<ProductsState> {
//   ProductsCubit() : super(ProductsInitialState());

//   final List<ProductEntity> allProducts = [];
//   final List<ProductEntity> feturedProducts = [];
//   bool _hasFetchedAllProducts = false;
//   bool _hasFetchedFeaturedProducts = false;

//   Future<void> fetchAllProducts({bool forceRefresh = false}) async {
//     await Future.delayed(Duration(seconds: 5));
//     if (!forceRefresh && _hasFetchedAllProducts && allProducts.isNotEmpty) {
//       if (kDebugMode) {
//         print("Categories already fetched, no need to fetch again.");
//       }
//       return;
//     }

//     emit(AllProductsLoadingState());

//     var result = await getIt<GetAllProductsUseCase>().call();

//     result.fold(
//       (error) {
//         emit(AllProductsFailureState(error));
//       },
//       (products) {
//         allProducts.clear();
//         allProducts.addAll(products);

//         emit(AllProductsLoadedState(products));
//         _hasFetchedAllProducts = true;
//       },
//     );
//   }

//   Future<void> fetchFeaturedProducts({bool forceRefresh = false}) async {
//     if (!forceRefresh &&
//         _hasFetchedFeaturedProducts &&
//         feturedProducts.isNotEmpty) {
//       if (kDebugMode) {
//         print("Categories already fetched, no need to fetch again.");
//       }
//       return;
//     }

//     emit(FeaturedProductsLoadingState());

//     var result = await getIt<GetFeturedProductsUseCase>().call();

//     result.fold(
//       (error) {
//         emit(FeaturedProductsFailureState(error));
//       },
//       (products) {
//         feturedProducts.clear();
//         feturedProducts.addAll(products);
//         emit(FeaturedProductsLoadedState(products));
//         _hasFetchedFeaturedProducts = true;
//       },
//     );
//   }

//   Future<void> refreshProducts() async {
//     _hasFetchedFeaturedProducts = false;
//     _hasFetchedAllProducts = false;
//     await fetchAllProducts(forceRefresh: true);
//     await fetchFeaturedProducts(forceRefresh: true);
//   }

//   @override
//   Future<void> close() {
//     if (kDebugMode) {
//       print('Products cubit closed');
//     }
//     return super.close();
//   }

//   String getProductPrice(ProductEntity product) {
//     double smllestPrice = double.infinity;
//     double largePrice = 0;
//     // if have a sale price ..
//     if (product.productType == ProductType.single.toString()) {
//       return (product.salePrice! > 0 ? product.salePrice : product.price)
//           .toString();
//     } else {
//       for (var variation in product.productVariations) {
//         double priceToConsider =
//             (variation.salePrice > 0.0) ? variation.salePrice : variation.price;

//         if (priceToConsider < smllestPrice) {
//           smllestPrice = priceToConsider;
//         }

//         if (priceToConsider > largePrice) {
//           largePrice = priceToConsider;
//         }
//       }
//       if (smllestPrice == largePrice) {
//         return largePrice.toString();
//       } else {
//         return '${smllestPrice.toString()} - ${largePrice.toString()}';
//       }
//     }
//   }

//   String? calculateProductDiscount(double originalPrice, double salePrice) {
//     if (salePrice <= 0.0) return null;
//     if (originalPrice <= 0) return null;

//     double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

//     return percentage.toStringAsFixed(0);
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/all_products/data/source/product_fire_base_services.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/repository/product_repository.dart';
import 'package:t_store/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either<dynamic, List<ProductEntity>>> getPopularProducts() async {
    var retunedData = await getIt<ProductFirebaseServices>().getAllProducts();

    return retunedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<ProductEntity> products = List.from(data)
            .map((document) => ProductModel.fromJson(document).toEntity())
            .toList();

        return Right(products);
      },
    );
  }

  @override
  Future<Either<dynamic, List<ProductEntity>>> getFeaturedProducts(
      {int limit = 4}) async {
    var retunedData = await getIt<ProductFirebaseServices>()
        .getFeaturedProducts(limit: limit);

    return retunedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<ProductEntity> products = List.from(data)
            .map((document) => ProductModel.fromJson(document).toEntity())
            .toList();

        return Right(products);
      },
    );
  }

  @override
  Future<Either<dynamic, List<ProductEntity>>> getAllFeaturedProducts(
      {required int limit}) async {
    var retunedData = await getIt<ProductFirebaseServices>()
        .getAllFeaturedProducts(limit: limit);

    return retunedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<ProductEntity> products = List.from(data)
            .map((document) => ProductModel.fromJson(document).toEntity())
            .toList();

        return Right(products);
      },
    );
  }

  @override
  Future<Either<dynamic, List<ProductEntity>>> getAllPopularProducts(
      {required int limit}) async {
    var retunedData = await getIt<ProductFirebaseServices>()
        .getAllPopularProducts(limit: limit);

    return retunedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<ProductEntity> products = List.from(data)
            .map((document) => ProductModel.fromJson(document).toEntity())
            .toList();

        return Right(products);
      },
    );
  }
}

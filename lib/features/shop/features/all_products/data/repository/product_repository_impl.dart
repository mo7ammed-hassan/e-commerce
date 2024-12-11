import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either<dynamic, List<ProductEntity>>> getProducts() async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}

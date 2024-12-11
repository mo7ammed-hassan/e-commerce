import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either<dynamic, List<ProductEntity>>> getProducts();
}

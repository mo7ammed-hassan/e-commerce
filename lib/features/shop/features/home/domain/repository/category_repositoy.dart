import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/home/domain/entites/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<String, List<CategoryEntity>>> getAllCategories();
}

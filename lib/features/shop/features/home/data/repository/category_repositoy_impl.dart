import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/home/data/models/category_model.dart';
import 'package:t_store/features/shop/features/home/data/source/category_firebase_services.dart';
import 'package:t_store/features/shop/features/home/domain/entites/category_entity.dart';
import 'package:t_store/features/shop/features/home/domain/repository/category_repositoy.dart';
import 'package:t_store/service_locator.dart';

class CategoryRepositoyImpl extends CategoryRepositoy {
  @override
  Future<Either<String, List<CategoryEntity>>> getAllCategories() async {
    var returnedData =
        await getIt<CategoryFirebaseServices>().getAllCategories();

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        List<CategoryEntity> allCategories = List.from(data)
            .map((document) => CategoryModel.fromJson(document).toEntity())
            .toList();

        return Right(allCategories);
      },
    );
  }
}

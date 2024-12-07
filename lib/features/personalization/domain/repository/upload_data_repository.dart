import 'package:t_store/features/shop/features/home/data/models/category_model.dart';

abstract class UploadDataRepository {
  Future<void> uploadCategoriesData(List<CategoryModel> categories);
}

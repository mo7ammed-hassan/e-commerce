import 'package:t_store/features/personalization/data/source/uplaod_data_firebase_services.dart';
import 'package:t_store/features/personalization/domain/repository/upload_data_repository.dart';
import 'package:t_store/features/shop/features/home/data/models/category_model.dart';
import 'package:t_store/service_locator.dart';

class UploadDataRepositoryImpl extends UploadDataRepository {
  @override
  Future<void> uploadCategoriesData(List<CategoryModel> categories) async {
    return await getIt<UploadDataFirebaseServices>()
        .uploadCategoriesDummyData(categories);
  }
}

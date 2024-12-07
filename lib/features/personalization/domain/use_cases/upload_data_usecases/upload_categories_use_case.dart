import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/personalization/domain/repository/upload_data_repository.dart';
import 'package:t_store/features/shop/features/home/data/models/category_model.dart';
import 'package:t_store/service_locator.dart';

class UploadCategoriesUseCase extends UseCases<dynamic, List<CategoryModel>> {
  @override
  Future call({List<CategoryModel>? params}) async {
    return await getIt<UploadDataRepository>().uploadCategoriesData(params!);
  }
}

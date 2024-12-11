import 'package:t_store/features/personalization/domain/repository/upload_data_repository.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/service_locator.dart';

class UploadProductUseCase {
  Future call(
      {required List<ProductModel> data, required String collection}) async {
    return await getIt<UploadDataRepository>()
        .uploadProductData(data, collection);
  }
}

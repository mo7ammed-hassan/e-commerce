import 'package:t_store/features/personalization/data/models/products/product_upload_model.dart';

abstract class UploadDataRepository {
  Future<void> uploadDummyData(List<dynamic> data, String collection);
  Future<void> uploadProductData(List<ProductUploadModel> data, String collection);
}

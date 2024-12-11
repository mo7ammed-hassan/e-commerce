import 'package:t_store/features/shop/features/home/data/models/product_model.dart';

abstract class UploadDataRepository {
  Future<void> uploadDummyData(List<dynamic> data, String collection);
  Future<void> uploadProductData(List<ProductModel> data, String collection);
}

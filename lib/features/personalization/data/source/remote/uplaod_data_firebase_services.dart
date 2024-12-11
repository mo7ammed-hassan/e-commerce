import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/data/source/remote/firebase_storage_services.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/enums.dart';

abstract class UploadDataFirebaseServices {
  Future<void> uploadDummyData(List<dynamic> data, String collection);
  Future<void> uploadProductData(List<ProductModel> data, String collection);
}

class UploadDataFirebaseServicesImpl extends UploadDataFirebaseServices {
  @override
  Future<void> uploadDummyData(List<dynamic> data, String collection) async {
    try {
      for (var item in data) {
        final file = await getIt<FirebaseStorageServices>()
            .getImageDataFromAssets(item.image);

        final url = await getIt<FirebaseStorageServices>()
            .uploadImageData(collection, file, item.name);

        item.image = url;

        await FirebaseFirestore.instance
            .collection(collection)
            .doc(item.id)
            .set(
              item.toJson(),
            );
      }
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  @override
  Future<void> uploadProductData(
      List<ProductModel> data, String collection) async {
    try {
      for (var product in data) {
        final thumbnail = await getIt<FirebaseStorageServices>()
            .getImageDataFromAssets(product.thumbnail);

        final url = await getIt<FirebaseStorageServices>().uploadImageData(
          collection,
          thumbnail,
          product.thumbnail.toString(),
        );

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetsImage = await getIt<FirebaseStorageServices>()
                .getImageDataFromAssets(image);

            final url = await getIt<FirebaseStorageServices>()
                .uploadImageData(collection, assetsImage, image);

            imagesUrl.add(url);
          }

          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var varition in product.productVariations!) {
            final assetsImage = await getIt<FirebaseStorageServices>()
                .getImageDataFromAssets(varition.image);

            final url = await getIt<FirebaseStorageServices>()
                .uploadImageData(collection, assetsImage, varition.image);

            varition.image = url;
          }
        }

        await FirebaseFirestore.instance
            .collection(collection)
            .doc(product.id)
            .set(
              product.toJson(),
            );
      }
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }
}

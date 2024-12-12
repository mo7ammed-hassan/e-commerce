import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/data/models/products/product_upload_model.dart';
import 'package:t_store/features/personalization/data/source/remote/firebase_storage_services.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/enums.dart';

abstract class UploadDataFirebaseServices {
  Future<void> uploadDummyData(List<dynamic> data, String collection);
  Future<void> uploadProductData(
      List<ProductUploadModel> data, String collection);
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
      List<ProductUploadModel> data, String collection) async {
    try {
      for (var product in data) {
        // Upload thumbnail image
        final thumbnailFile = await getIt<FirebaseStorageServices>()
            .getImageDataFromAssets(product.thumbnail);
        final thumbnailUrl = await getIt<FirebaseStorageServices>()
            .uploadImageData(collection, thumbnailFile, product.thumbnail);
        product.thumbnail = thumbnailUrl;

        // Upload product images (if available)
        if (product.images.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images) {
            final assetsImage = await getIt<FirebaseStorageServices>()
                .getImageDataFromAssets(image);
            final imageUrl = await getIt<FirebaseStorageServices>()
                .uploadImageData(collection, assetsImage, image);
            imagesUrl.add(imageUrl);
          }
          product.images.clear();
          product.images.addAll(imagesUrl);
        }

        // Upload product variations (if product type is variable)
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations) {
            final variationImageFile = await getIt<FirebaseStorageServices>()
                .getImageDataFromAssets(variation.image);
            final variationImageUrl = await getIt<FirebaseStorageServices>()
                .uploadImageData(
                    collection, variationImageFile, variation.image);
            variation.image = variationImageUrl;
          }
        }

        // Finally, upload product data to Firestore
        await FirebaseFirestore.instance
            .collection(collection)
            .doc(product.id)
            .set(product.toJson());
      }
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }
}

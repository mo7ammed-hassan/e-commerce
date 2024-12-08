import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/data/source/firebase_storage_services.dart';
import 'package:t_store/features/shop/features/home/data/models/category_model.dart';
import 'package:t_store/service_locator.dart';

abstract class UploadDataFirebaseServices {
  // upload categories
  Future<void> uploadCategoriesDummyData(List<CategoryModel> categories);
}

class UploadDataFirebaseServicesImpl extends UploadDataFirebaseServices {
  @override
  Future<void> uploadCategoriesDummyData(List<CategoryModel> categories) async {
    try {
      for (var category in categories) {
        final file = await getIt<FirebaseStorageServices>()
            .getImageDataFromAssets(category.image);

        final url = await getIt<FirebaseStorageServices>()
            .uploadImageData('Categories', file, category.name);

        category.image = url;

        await FirebaseFirestore.instance
            .collection('Categories')
            .doc(category.id)
            .set(
              category.toJson(),
            );
      }
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}

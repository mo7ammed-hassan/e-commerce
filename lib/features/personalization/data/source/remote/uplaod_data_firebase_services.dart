import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/data/source/remote/firebase_storage_services.dart';
import 'package:t_store/service_locator.dart';

abstract class UploadDataFirebaseServices {
  Future<void> uploadDummyData(List<dynamic> data, String collection);
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
}

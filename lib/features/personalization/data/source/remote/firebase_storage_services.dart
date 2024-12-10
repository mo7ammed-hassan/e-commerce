import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

abstract class FirebaseStorageServices {
  // get image data from assets folder Uint8List conatins image data
  Future<Uint8List> getImageDataFromAssets(String path);

  // upload image using imageData on cloud firebase storage
  // return the downloaded url image
  Future<String> uploadImageData(String path, Uint8List image, String name);
}

class FirebaseStorageServicesImpl extends FirebaseStorageServices {
  final _storage = FirebaseStorage.instance;

  @override
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      return imageData;
    } catch (e) {
      throw 'Error Loading image data: $e';
    }
  }

  @override
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _storage.ref(path).child(name);
      await ref.putData(image);

      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Error uploading image: $e';
    }
  }
}

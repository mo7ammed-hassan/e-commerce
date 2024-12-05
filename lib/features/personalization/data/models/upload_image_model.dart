import 'package:image_picker/image_picker.dart';

class UploadImageModel {
  final String path;
  final XFile image;

  UploadImageModel({required this.path, required this.image});
}

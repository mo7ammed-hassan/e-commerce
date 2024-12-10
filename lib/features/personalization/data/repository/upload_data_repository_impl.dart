import 'package:t_store/features/personalization/data/source/uplaod_data_firebase_services.dart';
import 'package:t_store/features/personalization/domain/repository/upload_data_repository.dart';
import 'package:t_store/service_locator.dart';

class UploadDataRepositoryImpl extends UploadDataRepository {
  @override
  Future<void> uploadDummyData(List<dynamic> data, String collection) async {
    return await getIt<UploadDataFirebaseServices>()
        .uploadDummyData(data, collection);
  }
}

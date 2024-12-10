import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_data_usecases/upload_categories_use_case.dart';
import 'package:t_store/service_locator.dart';

part 'upload_data_state.dart';

class UploadDataCubit extends Cubit<UploadDataState> {
  UploadDataCubit() : super(UploadDataInitial());

  void uploadDummyData(
      {required List<dynamic> data, required String collection}) async {
    emit(UploadDataloading(collection));
    try {
      await getIt<UploadDummyDataUseCase>()
          .call(data: data, collection: collection);
      emit(UploadDataSuccess('Successfully Uploaded $collection'));
    } catch (e) {
      emit(UploadDataFailure(e.toString()));
    }
  }
}

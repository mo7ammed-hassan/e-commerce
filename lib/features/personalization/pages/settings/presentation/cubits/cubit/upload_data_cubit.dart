import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/models/dummy_data.dart';
import 'package:t_store/features/personalization/domain/use_cases/upload_data_usecases/upload_categories_use_case.dart';
import 'package:t_store/service_locator.dart';

part 'upload_data_state.dart';

class UploadDataCubit extends Cubit<UploadDataState> {
  UploadDataCubit() : super(UploadDataInitial());

  void uploadCategoryData() async {
    emit(UploadDataUploading('Categories'));
    try {
      await getIt<UploadCategoriesUseCase>().call(params: DummyData.categories);
      emit(UploadDataSuccess('Successfully uploaded'));
    } catch (e) {
      emit(UploadDataFailure(e.toString()));
      throw 'Error uploading $e';
    }
  }
}

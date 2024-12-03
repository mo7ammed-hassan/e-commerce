import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/personalization/domain/use_cases/fetch_user_data_use_case.dart';
import 'package:t_store/features/personalization/manager/fetch_user_data_state.dart';
import 'package:t_store/service_locator.dart';

class FetchUserDataCubit extends Cubit<FetchUserDataState> {
  FetchUserDataCubit() : super(FetchUserDataLoadingState());

  void fetchUserData() async {
    emit(FetchUserDataLoadingState());

    var returnedData = await getIt<FetchUserDataUseCase>().call();

    returnedData.fold(
      (error) {
        emit(FetchUserDataFailedState(error));
      },
      (userData) {
        emit(FetchUserDataLoadedState(userData));
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/personalization/domain/use_cases/fetch_user_data_use_case.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/features/personalization/domain/use_cases/update_user_filed_use_case.dart';
import 'package:t_store/service_locator.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(FetchUserDataLoadingState());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Future<void> fetchUserData() async {
    emit(FetchUserDataLoadingState());

    var returnedData = await getIt<FetchUserDataUseCase>().call();

    returnedData.fold(
      (error) {
        emit(FetchUserDataFailedState(error));
      },
      (userData) {
        firstNameController.text = userData.firstName;
        lastNameController.text = userData.lastName;
        emit(FetchUserDataLoadedState(userData));
      },
    );
  }

  void updateUserFiled() async {
    if (!fromKey.currentState!.validate()) {
      return;
    }

    emit(UpdateUserDataLoadingState());

    var result = await getIt<UpdateUserFiledUseCase>().call(params: {
      'firstName': firstNameController.text.trim(),
      'lastName': lastNameController.text.trim(),
    });

    result.fold(
      (error) {
        emit(UpdateUserFailureState(error));
      },
      (message) async {
        emit(UpdateUserSuccessState(message));
        await fetchUserData();
      },
    );
  }

  @override
  void emit(UserState state) {
    super.emit(state);
    if (kDebugMode) {
      print('State emitted: $state');
    }
  }
}

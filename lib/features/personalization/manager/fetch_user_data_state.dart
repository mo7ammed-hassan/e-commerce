import 'package:t_store/features/personalization/domain/entites/user_entity.dart';

abstract class UserDataState {}

class FetchUserDataLoadingState extends UserDataState {}

class FetchUserDataLoadedState extends UserDataState {
  final UserEntity userData;

  FetchUserDataLoadedState(this.userData);
}

class FetchUserDataFailedState extends UserDataState {
  final String errorMessage;

  FetchUserDataFailedState(this.errorMessage);
}

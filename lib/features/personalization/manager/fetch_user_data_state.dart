import 'package:t_store/features/personalization/domain/entites/user_entity.dart';

abstract class FetchUserDataState {}

class FetchUserDataLoadingState extends FetchUserDataState {}

class FetchUserDataLoadedState extends FetchUserDataState {
  final UserEntity userData;

  FetchUserDataLoadedState(this.userData);
}

class FetchUserDataFailedState extends FetchUserDataState {
  final String errorMessage;

  FetchUserDataFailedState(this.errorMessage);
}

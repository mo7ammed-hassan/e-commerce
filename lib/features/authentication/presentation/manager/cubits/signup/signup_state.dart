abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupSuccessState extends SignupState {
  final String successMessage;

  SignupSuccessState(this.successMessage);
}

class SignupErrorState extends SignupState {
  final String errorMessage;

  SignupErrorState(this.errorMessage);
}

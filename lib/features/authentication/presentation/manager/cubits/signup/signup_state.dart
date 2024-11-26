abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final String message;
  SignupSuccessState(this.message);
}

class SignupErrorState extends SignupState {
  final String errorMessage;
  SignupErrorState(this.errorMessage);
}

class PrivacyValidationErrorState extends SignupState {
  final String errorMessage;
  PrivacyValidationErrorState(this.errorMessage);
}

abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String errorMessage;

  SignupErrorState(this.errorMessage);
}



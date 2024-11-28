abstract class SignInState {}

class SigninInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final String successMessage;

  SignInSuccessState(this.successMessage);
}

class SignInErrorState extends SignInState {
  final String errorMessage;

  SignInErrorState(this.errorMessage);
}

class RememberMeErrorState extends SignInState {
  final String errorMessage;
  RememberMeErrorState(this.errorMessage);
}

abstract class VerifyEmailState {}

class VerifyEmailLoadingState extends VerifyEmailState {}

class SuccessSendVerifyEmailState extends VerifyEmailState {
  final String successMessage;

  SuccessSendVerifyEmailState(this.successMessage);
}

class VerifyEmailErrorState extends VerifyEmailState {
  final String errorMessage;
  VerifyEmailErrorState(this.errorMessage);
}

class VerifiyEmailSuccessState extends VerifyEmailState {
  final String successMessage;

  VerifiyEmailSuccessState(this.successMessage);
}

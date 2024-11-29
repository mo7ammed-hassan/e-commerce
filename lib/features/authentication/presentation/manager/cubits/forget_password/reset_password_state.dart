abstract class ResetPasswordState {}

// loading
class ResetPasswordLoadingState extends ResetPasswordState {}

// success
class ResetPasswordSuccessState extends ResetPasswordState {
  final String successMessage;

  ResetPasswordSuccessState(this.successMessage);
}

// error

class ResetPasswordErrorState extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordErrorState(this.errorMessage);
}

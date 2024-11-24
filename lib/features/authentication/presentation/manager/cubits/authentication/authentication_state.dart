abstract class AuthenticationCubitState {}

// -------Authentication states-------

class UnauthenticatedState extends AuthenticationCubitState {}

class AuthenticatedState extends AuthenticationCubitState {
  final String userId;

  AuthenticatedState(this.userId);
}

// -------Authentication service-------

class AuthenticatedLoadingState extends AuthenticationCubitState {}

class AuthenticatedSuccessState extends AuthenticationCubitState {
  final String message;

  AuthenticatedSuccessState(this.message);
}

class AuthenticatedFailureState extends AuthenticationCubitState {
  final String error;

  AuthenticatedFailureState(this.error);
}

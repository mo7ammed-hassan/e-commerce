abstract class PasswordAndSelectionState {}

class PasswordAndSelectionInitialState extends PasswordAndSelectionState {}

class PasswordVisibleState extends PasswordAndSelectionState {
  final bool isVisible;

  PasswordVisibleState(this.isVisible);
}

class PrivacyAcceptedState extends PasswordAndSelectionState {
  final bool isPrivacyAccepted;

  PrivacyAcceptedState(this.isPrivacyAccepted);
}

class RememberMeState extends PasswordAndSelectionState {
  final bool isRemembered;
  RememberMeState(this.isRemembered);
}

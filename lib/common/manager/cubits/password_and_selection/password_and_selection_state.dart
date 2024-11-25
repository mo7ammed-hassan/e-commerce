abstract class PasswordAndSelectionState {}

class PasswordAndSelectionInitialState extends PasswordAndSelectionState {}

class PasswordVisibleState extends PasswordAndSelectionState {
  final bool isVisible;

  PasswordVisibleState(this.isVisible);
}

class UserSelectedState extends PasswordAndSelectionState {
  final bool isSelected;

  UserSelectedState(this.isSelected);
}

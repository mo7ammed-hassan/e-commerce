// password_and_selection_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'password_and_selection_state.dart';

class PasswordAndSelectionCubit extends Cubit<PasswordAndSelectionState> {
  PasswordAndSelectionCubit() : super(PasswordAndSelectionInitialState());

  bool isPasswordHidden = true; // Default password visibility is hidden
  bool isSelected = false; // Default checkbox is not selected

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(PasswordVisibleState(isPasswordHidden));
  }

  // Toggle checkbox selection
  void toggleUserSelection(bool isSelected) {
    this.isSelected = isSelected;
    emit(UserSelectedState(isSelected));
  }
}

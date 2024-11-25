// password_and_selection_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'password_and_selection_state.dart';

class PasswordAndSelectionCubit extends Cubit<PasswordAndSelectionState> {
  PasswordAndSelectionCubit() : super(PasswordAndSelectionInitialState());

  bool isPasswordHidden = true; // Default password visibility is hidden
  bool isPrivacyAccepted = false; // Default checkbox is not selected
  bool isRememberMe = false; // Default remember me is not selected

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(PasswordVisibleState(isPasswordHidden));
  }

  // Toggle Privacy
  void togglePrivacyAcceptance() {
    isPrivacyAccepted = !isPrivacyAccepted;
    emit(PrivacyAcceptedState(isPrivacyAccepted));
  }

  // Toggle remember me
  void toggleRememberMe() {
    isRememberMe = !isRememberMe;
    emit(RememberMeState(isRememberMe));
  }
}

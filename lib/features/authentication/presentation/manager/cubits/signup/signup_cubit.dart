import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/signup_state.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitialState());

  // Controller
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // validation
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Signup logic
  void signup(bool isPrivacyAccepted) {
    // start Loading
    TFullScreenLoader.openLoadingDialog(
      'We are processing your information...',
      TImages.docerAnimation,
    );
    // Validation checks
    if (!validateForm()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    if (!isPrivacyAccepted) {
      // stop loading
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message:
            'In order create account, you must have to read and accept the Privacy Policy & Terms of Use',
      );
      return;
    }

    //call usecase // fold
  }
}

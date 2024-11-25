import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';
import 'package:t_store/features/authentication/domain/use_cases/signup_usecase.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/signup_state.dart';
import 'package:t_store/service_locator.dart';
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

  void signup(bool isPrivacyAccepted) async {
    // start Loading
    TFullScreenLoader.openLoadingDialog(
      'We are processing your information...',
      TImages.docerAnimation,
    );
    // --Validation checks--
    if (!validateForm()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    if (!isPrivacyAccepted) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message:
            'In order create account, you must have to read and accept the Privacy Policy & Terms of Use',
      );
      return;
    }

    var result = await getIt<SignupUsecase>().call(
      params: UserCreationModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        username: usernameController.text,
        userEmail: emailController.text,
        password: passwordController.text,
        userPhone: phoneController.text,
        profilePicture: '',
      ),
    );

    result.fold(
      (errorMessage) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: errorMessage,
        );

        emit(SignupErrorState(errorMessage));
      },
      (successMessage) {
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(
          title: 'Congratulations',
          message: successMessage,
        );
        emit(SignupSuccessState(successMessage));
      },
    );
  }
}

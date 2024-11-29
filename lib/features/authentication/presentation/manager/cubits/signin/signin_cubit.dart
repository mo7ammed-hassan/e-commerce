import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';
import 'package:t_store/features/authentication/domain/use_cases/signin_usecase.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signin/signin_state.dart';
import 'package:t_store/service_locator.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SigninInitialState());

  // Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // validation
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void signIn(isRememberMe) async {
    if (!validateForm()) return;

    // if (!isRememberMe) {
    //   emit(
    //     RememberMeErrorState(
    //       'In order create account, you must have to read and accept the Privacy Policy & Terms of Use',
    //     ),
    //   );
    //   return;
    // }

    // Construct user creation model
    final user = UserSigninModel(
      uerEmail: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // Start Loading
    emit(SignInLoadingState());

    var result = await getIt<SignInUsecase>().call(params: user);

    result.fold(
      (errorMessage) => emit(SignInErrorState(errorMessage)),
      (successMessage) => emit(SignInSuccessState(successMessage)),
    );
  }

  @override
  Future<void> close() {
    // Dispose controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signin/signin_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  // Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // validation
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // login logic
}

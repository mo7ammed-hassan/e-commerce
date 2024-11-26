import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/manager/cubits/launch_app/launch_app_cubit.dart';
import 'package:t_store/features/authentication/presentation/pages/login_page.dart';
import 'package:t_store/features/authentication/presentation/pages/onboarding_page.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LaunchAppCubit, bool>(
      listener: (context, isFirstLaunch) {
        if (isFirstLaunch) {
          context.removeAll(const OnBoardingPage());
        } else {
          context.removeAll(const LoginPage());
        }
      },
      child: const Scaffold(
        body: Center(
          child: SingleChildScrollView(),
        ),
      ),
    );
  }
}

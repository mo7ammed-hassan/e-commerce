import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/first_launch/is_first_launch_cubit.dart';
import 'package:t_store/features/authentication/presentation/pages/login_page.dart';
import 'package:t_store/features/authentication/presentation/pages/onboarding_page.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsFirstLaunchCubit, bool>(
      builder: (context, isFirstLaunch) {
        if (isFirstLaunch) {
          return const OnBoardingPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}

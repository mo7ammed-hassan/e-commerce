import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/login_signup/scocial_button.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signin/signin_with_google_cubit.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signin/signin_with_google_state.dart';
import 'package:t_store/features/authentication/presentation/pages/verify_email_page.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInWithGoogleCubit(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<SignInWithGoogleCubit, SignInWithGoogleState>(
            listener: (context, state) {
              if (state is SignInWithGoogleLoadingState) {
                TFullScreenLoader.openLoadingDialog(
                  'Logging you in...',
                  TImages.docerAnimation,
                );
              } else if (state is SignInWithGoogleFaliureState) {
                TFullScreenLoader.stopLoading();
                Loaders.errorSnackBar(
                  title: 'Error',
                  message: state.errorMessage,
                );
              } else if (state is SignInWithGoogleSuccessState) {
                TFullScreenLoader.stopLoading();
                _navigateToMenuPage(context);
              } else if (state is NotVerifiedEmailState) {
                TFullScreenLoader.stopLoading();
                context.removeAll(VerifyEmailPage(email: state.email));
                Loaders.successSnackBar(
                  title: 'Email Not Verified',
                  message: 'Please Check your inbox and verify email.',
                );
              }
            },
            child: Builder(builder: (context) {
              return TSocialButton(
                onPressed: () =>
                    context.read<SignInWithGoogleCubit>().signInWithGoogle(),
                socialIcon: TImages.google,
              );
            }),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),
          const TSocialButton(socialIcon: TImages.facebook),
        ],
      ),
    );
  }

  _navigateToMenuPage(BuildContext context) {
    context.removeAll(const NavigationMenu());
  }
}

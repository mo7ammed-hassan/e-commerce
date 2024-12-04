import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/features/authentication/presentation/pages/login_page.dart';
import 'package:t_store/features/personalization/pages/profile/cuits/re_auth_user_cubit.dart';
import 'package:t_store/features/personalization/pages/profile/cuits/re_auth_user_state.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/navigation.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthUserForm extends StatelessWidget {
  const ReAuthUserForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reAuthUserCubit = context.read<ReAuthUserCubit>();
    return BlocListener<ReAuthUserCubit, ReAuthUserState>(
      listener: (context, state) {
        if (state is ReAuthLoadingState) {
          TFullScreenLoader.openLoadingDialog(
            'Processing...',
            TImages.docerAnimation,
          );
        } else if (state is ReAuthSuccessState) {
          TFullScreenLoader.stopLoading();
          context.removeAll(const LoginPage());
        }
      },
      child: Form(
        key: reAuthUserCubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: reAuthUserCubit.emailController,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              obscureText: context
                  .read<PasswordAndSelectionCubit>()
                  .state
                  .isPasswordHidden,
              controller: reAuthUserCubit.passwordController,
              validator: (value) =>
                  TValidator.validateEmptyText('Password', value),
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<PasswordAndSelectionCubit>()
                        .togglePasswordVisibility();
                  },
                  icon: Icon(
                    context
                            .read<PasswordAndSelectionCubit>()
                            .state
                            .isPasswordHidden
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  reAuthUserCubit.reauthenticate();
                },
                child: const Text('Verify'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_state.dart';
import 'package:t_store/common/widgets/checkbox/custom_checkbox.dart';
import 'package:t_store/common/widgets/text_filed/password_field.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signin/signin_cubit.dart';
import 'package:t_store/features/authentication/presentation/pages/forget_password_page.dart';
import 'package:t_store/features/authentication/presentation/pages/signup_page.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordAndSelectionCubit(),
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections,
          ),
          child: Column(
            children: [
              _emailField(context),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const PasswordField(),
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),
              // Remember Me & Forget Password
              _rememberMeAndForgetPassword(context),
              const SizedBox(height: TSizes.spaceBtwSections),
              _signIn(context),
              const SizedBox(height: TSizes.spaceBtwItems),
              _createAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _emailField(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().emailController,
      validator: (value) => TValidator.validateEmail(value),
      decoration: const InputDecoration(
        labelText: TTexts.email,
        prefixIcon: Icon(Iconsax.direct_right),
      ),
    );
  }

  Widget _rememberMeAndForgetPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<PasswordAndSelectionCubit, PasswordAndSelectionState>(
              builder: (context, state) {
                return CustomCheckbox(
                  value: state.isRememberMe,
                  onChanged: (value) => context
                      .read<PasswordAndSelectionCubit>()
                      .toggleRememberMe(),
                );
              },
            ),
            const SizedBox(width: 5),
            const Text(TTexts.rememberMe),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgetPasswordPage(),
              ),
            );
          },
          child: const Text(
            TTexts.forgetPassword,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _signIn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (context.read<LoginCubit>().validateForm()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationMenu(),
              ),
            );
          }
        },
        child: const Text(TTexts.signIn),
      ),
    );
  }

  SizedBox _createAccount(context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          // Navigate to Sign Up screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupPage(),
            ),
          );
        },
        child: const Text(TTexts.createAccount),
      ),
    );
  }
}

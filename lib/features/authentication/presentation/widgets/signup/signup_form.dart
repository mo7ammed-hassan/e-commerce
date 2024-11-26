import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/widgets/text_filed/password_field.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/signup_cubit.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/signup_state.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/verify_email_cubit.dart';
import 'package:t_store/features/authentication/presentation/pages/verify_email_page.dart';
import 'package:t_store/features/authentication/presentation/widgets/signup/term_and_condation_checkbox.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          Row(
            children: [
              _firstNameField(context),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              _lastNameField(context),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _userNameField(context),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _emailField(context),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _phoneNumberField(context),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          PasswordField(
            controller: context.read<SignupCubit>().passwordController,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TTermAndCondationCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          _createAccount(context),
        ],
      ),
    );
  }

  Expanded _firstNameField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        expands: false,
        controller: context.read<SignupCubit>().firstNameController,
        validator: (value) => TValidator.validateEmptyText('First Name', value),
        decoration: const InputDecoration(
          labelText: TTexts.firstName,
          prefixIcon: Icon(Iconsax.user),
        ),
      ),
    );
  }

  Expanded _lastNameField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: context.read<SignupCubit>().lastNameController,
        validator: (value) => TValidator.validateEmptyText('Last Name', value),
        expands: false,
        decoration: const InputDecoration(
          labelText: TTexts.lastName,
          prefixIcon: Icon(Iconsax.user),
        ),
      ),
    );
  }

  TextFormField _userNameField(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().usernameController,
      validator: (value) => TValidator.validateEmptyText('username', value),
      decoration: const InputDecoration(
        labelText: TTexts.username,
        prefixIcon: Icon(Iconsax.user_edit),
      ),
    );
  }

  TextFormField _emailField(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().emailController,
      validator: (value) => TValidator.validateEmail(value),
      decoration: const InputDecoration(
        labelText: TTexts.email,
        prefixIcon: Icon(Iconsax.direct),
      ),
    );
  }

  TextFormField _phoneNumberField(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().phoneController,
      validator: (value) => TValidator.validatePhoneNumber(value),
      decoration: const InputDecoration(
        errorMaxLines: 2,
        labelText: TTexts.phoneNo,
        prefixIcon: Icon(Iconsax.call),
      ),
    );
  }

  SizedBox _createAccount(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is PrivacyValidationErrorState) {
            TLoaders.warningSnackBar(
              title: 'Accept Privacy Policy',
              message: state.errorMessage,
            );
          } else if (state is SignupLoadingState) {
            TFullScreenLoader.openLoadingDialog(
              'We are processing your information...',
              TImages.docerAnimation,
            );
          } else if (state is SignupErrorState) {
            TFullScreenLoader.stopLoading();
            TLoaders.errorSnackBar(
              title: 'Error',
              message: state.errorMessage,
            );
          } else if (state is SignupSuccessState) {
            _navigateToVerifyEmail(
              context,
              context.read<SignupCubit>().emailController.text.trim(),
            );
            TLoaders.successSnackBar(
              title: 'Congratulations',
              message: state.message,
            );
          }
        },
        child: ElevatedButton(
          onPressed: () {
            final isPrivacyAccepted =
                context.read<PasswordAndSelectionCubit>().isPrivacyAccepted;
            context.read<SignupCubit>().signup(isPrivacyAccepted);
          },
          child: const Text(TTexts.createAccount),
        ),
      ),
    );
  }

  void _navigateToVerifyEmail(BuildContext context, email) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => VerifyEmailCubit()..verifyEmail(),
          child: VerifyEmailPage(
            email: email,
          ),
        ),
      ),
      (route) => false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/widgets/text_filed/password_field.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/signup_cubit.dart';
import 'package:t_store/features/authentication/presentation/widgets/signup/term_and_condation_checkbox.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordAndSelectionCubit(),
      child: Form(
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
      child: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            final passwordAndSelectionCubit =
                context.read<PasswordAndSelectionCubit>();
            context
                .read<SignupCubit>()
                .signup(passwordAndSelectionCubit.isPrivacyAccepted);
            // if (context.read<SignupCubit>().validateForm()) {
            //   Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const VerifyEmailPage(),
            //     ),
            //     (route) => false,
            //   );
            // }
          },
          child: const Text(TTexts.createAccount),
        );
      }),
    );
  }
}

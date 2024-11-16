import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/presentation/pages/verify_email_page.dart';
import 'package:t_store/features/authentication/presentation/widgets/signup/term_and_condation_checkbox.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              _firstNameField(),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              _lastNameField(),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _userNameField(),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _emailField(),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _phoneNumberField(),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          _passwordField(),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TTermAndCondationCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          _createAccount(context),
        ],
      ),
    );
  }

  Expanded _firstNameField() {
    return Expanded(
      child: TextFormField(
        expands: false,
        decoration: const InputDecoration(
          labelText: TTexts.firstName,
          prefixIcon: Icon(Iconsax.user),
        ),
      ),
    );
  }

  Expanded _lastNameField() {
    return Expanded(
      child: TextFormField(
        expands: false,
        decoration: const InputDecoration(
          labelText: TTexts.lastName,
          prefixIcon: Icon(Iconsax.user),
        ),
      ),
    );
  }

  TextFormField _userNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: TTexts.username,
        prefixIcon: Icon(Iconsax.user_edit),
      ),
    );
  }

  TextFormField _emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: TTexts.email,
        prefixIcon: Icon(Iconsax.direct),
      ),
    );
  }

  TextFormField _phoneNumberField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: TTexts.phoneNo,
        prefixIcon: Icon(Iconsax.call),
      ),
    );
  }

  TextFormField _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: TTexts.password,
        prefixIcon: Icon(Iconsax.password_check),
        suffixIcon: Icon(Iconsax.eye_slash),
      ),
    );
  }

  SizedBox _createAccount(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const VerifyEmailPage(),
            ),
            (route) => false,
          );
        },
        child: const Text(TTexts.createAccount),
      ),
    );
  }
}

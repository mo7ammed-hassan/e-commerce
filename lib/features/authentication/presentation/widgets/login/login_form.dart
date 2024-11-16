import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            _emailField(),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            _passwordField(),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            // Remember Me & Forget Password
            _rememberMeAndForgetPassword(),
            const SizedBox(height: TSizes.spaceBtwSections),
            _signIn(),
            const SizedBox(height: TSizes.spaceBtwItems),
            _createAccount(),
          ],
        ),
      ),
    );
  }

  TextFormField _emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: TTexts.email,
        prefixIcon: Icon(Iconsax.direct_right),
      ),
    );
  }

  TextFormField _passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: TTexts.password,
        prefixIcon: Icon(Iconsax.password_check),
        suffixIcon: Icon(Iconsax.eye_slash),
      ),
    );
  }

  Row _rememberMeAndForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            const Text(TTexts.rememberMe),
          ],
        ),
        TextButton(
          onPressed: () {},
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

  SizedBox _signIn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(TTexts.signIn),
      ),
    );
  }

  SizedBox _createAccount() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        child: const Text(TTexts.createAccount),
      ),
    );
  }
}

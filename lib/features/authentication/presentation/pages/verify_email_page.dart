import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/success_pages/success_page.dart';
import 'package:t_store/features/authentication/presentation/pages/login_page.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                width: THelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(TImages.deliveredEmailIllustration),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              _userEmail(context),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              _continueButton(context),
              const SizedBox(height: TSizes.spaceBtwItems),
              _resendButton(),
            ],
          ),
        ),
      ),
    );
  }

  Text _userEmail(BuildContext context) {
    return Text(
      'mohamedhassank96@gmail.com',
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }

  SizedBox _continueButton(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to success page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessPage(
                image: TImages.staticSuccessIllustration,
                title: TTexts.yourAccountCreatedTitle,
                subtitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
            (route) => false,
          );
        },
        child: const Text(TTexts.tContinue),
      ),
    );
  }

  SizedBox _resendButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(
          TTexts.resendEmail,
          style: const TextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/presentation/widgets/login/login_form.dart';
import 'package:t_store/features/authentication/presentation/widgets/login/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            // Logo, Title & sub-title
            TLoginHeader(),
            // Form
            TLoginForm(),
            // Divider
            TFormDivider(dividerText: TTexts.orSignInWith),
            SizedBox(height: TSizes.spaceBtwSections),
            // Footer
            TSocialButtons(),
          ],
        ),
      ),
    );
  }
}

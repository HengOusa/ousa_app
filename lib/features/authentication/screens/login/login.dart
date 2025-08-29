import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/styles/spacing_styles.dart';
import 'package:ousa_app/common/widgets/login_signup/form_divider.dart';
import 'package:ousa_app/common/widgets/login_signup/social_buttons.dart';
import 'package:ousa_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ousa_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/constants/text_strings.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          // Logo , Title and Sub-Title

          child: Column(
            children: [
              // logo , Title and Sub-Title
              TLoginHeader(dark: dark),

              // Form
              const TLoginForm(),

              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              // footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

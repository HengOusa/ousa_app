import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/widgets/login_signup/form_divider.dart';
import 'package:ousa_app/common/widgets/login_signup/social_buttons.dart';
import 'package:ousa_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title

              Text(
                TTexts.signIn,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              
              // Signup Form
              const TSignupForm(),
              const SizedBox(height: TSizes.defaultSpace),

              // Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.defaultSpace),

              // Social Button
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

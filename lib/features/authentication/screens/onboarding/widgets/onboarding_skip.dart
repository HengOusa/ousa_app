import 'package:flutter/material.dart';
import 'package:ousa_app/features/authentication/controllers/onboardig/onboarding_controller.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/device/device_utitity.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/features/authentication/controllers/onboardig/onboarding_controller.dart';
import 'package:ousa_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ousa_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ousa_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ousa_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onboardingImageLight1,
                darkImage: TImages.onboardingImageDark1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImages.onboardingImagLight2,
                darkImage: TImages.onboardingImageDark2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImages.onboardingImageLight3,
                darkImage: TImages.onboardingImageDark3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubtitle3,
              ),
            ],
          ),
          // skip Button

          const OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator

          const OnboardingDotNavigation(),
          // Circular
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ousa_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ousa_app/data/repositories/user/user_repository.dart';
import 'package:ousa_app/features/authentication/controllers/signup/network_manager.dart';
import 'package:ousa_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ousa_app/features/personalization/models/user_model.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/popups/full_screen_loader.dart';
import 'package:ousa_app/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // Observable for hiding / showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptiance
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form Validations

  // -- Signup

  Future<void> signup() async {
    try {
      // start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.loadingAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',
        );
        TFullScreenLoader.stopLoading();

        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email continue.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Show some Generic Erroe to the userba
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: "This email Already Signed Up");

      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}

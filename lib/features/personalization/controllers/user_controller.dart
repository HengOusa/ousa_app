import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ousa_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ousa_app/data/repositories/user/user_repository.dart';
import 'package:ousa_app/features/authentication/controllers/signup/network_manager.dart';
import 'package:ousa_app/features/authentication/screens/login/login.dart';
import 'package:ousa_app/features/personalization/models/user_model.dart';
import 'package:ousa_app/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/popups/full_screen_loader.dart';
import 'package:ousa_app/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Variables
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final password = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch User record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any Registration provider
  // Future<void> saveUserRecord(UserCredential? userCredentials) async {
  //   // Convert Name to First and Last name
  //   try {
  //     // First Update Rx and then check if user data is already stored . if nnot store new data
  //     await fetchUserRecord();
  //     // if no record already stored
  //     if (user.value.id.isEmpty) {
  //       if (userCredentials != null) {
  //         final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
  //         final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

  //         // Map Data
  //         final newUser = UserModel(
  //             id: userCredentials.user!.uid,
  //             firstName: nameParts[0],
  //             lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
  //             username: username,
  //             email: userCredentials.user!.email ?? '',
  //             phoneNumber: userCredentials.user!.phoneNumber ?? '',
  //             profilePicture: userCredentials.user!.photoURL ?? '');
  //       }
  //     }
  //     // Save user data
  //     await userRepository.saveUserRecord(user as UserModel );

  //     throw Exception("User credentials are null");
  //     // Save user data only if user is not null
  //   } catch (e) {
  //     TLoaders.warningSnackBar(
  //       title: 'Data not Save',
  //       message:
  //           'Something went wrong while saving your information.You can re-save your data in your Profile $e',
  //     );
  //     print("Error: " + e.toString());
  //   }
  // }
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials == null) {
        throw Exception("User credentials are null");
      }

      // Fetch existing user record
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        // Convert Name to First and Last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(newUser);
      } else {
        print("User record already exists in Firestore.");
      }
    } catch (e, stackTrace) {
      print("Error saving user record: $e");
      print("Stack Trace: $stackTrace");
      TLoaders.warningSnackBar(
        title: 'Data Not Saved',
        message:
            'Something went wrong while saving your information. Please try again. $e',
      );
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!),
            child: const Text('Cancel')));
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      // first re-authenticate
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email

        if (provider == 'goolge.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticationUserLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re Authentication before deleting
  Future<void> reAuthenticationEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing', TImages.loadingAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticationWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Upload Profile Image
  uploadUserProfileImagePicture() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);
    if (image != null) {
      // Upload Image
      final imageUrl = await userRepository.uploadImage('profile', image);

      // Update User Image Record
      Map<String, dynamic> json = {'ProfilePicture': imageUrl};
      await userRepository.updateSingleField(json);
      user.value.profilePicture = imageUrl;
    }
  }
}

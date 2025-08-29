


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ousa_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ousa_app/features/personalization/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final supabase = Supabase.instance.client;
  final FirebaseFirestore _db = FirebaseFirestore.instance;



  // Function to save user data to Firestore

  Future<void> saveUserRecord(UserModel user) async{
    try {
      // final docRef = FirebaseFirestore.instance.collection('Users').doc(user.id);
      // await docRef.set(user.tojson());
      await _db.collection("Users").doc(user.id).set(user.tojson());
    } on FirebaseAuthException catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to fetch user details based on user ID.

  Future<UserModel> fetchUserDetails() async{
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to update user data in Firestore 

  Future<void> updateUserDetails(UserModel updateUser) async{
    try {
     await _db.collection("Users").doc(updateUser.id).update(updateUser.tojson());
    } on FirebaseAuthException catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Update any field in specific Users Conllection
  Future<void> updateSingleField(Map<String,dynamic> json) async{
    try {
      await _db.collection("Users").doc().update(json);
    } on FirebaseAuthException catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }


  // Function to remove data from Firestore
  Future<void> removeUserRecord(String userId) async{
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }


  // Upload any Image 
  Future<String> uploadImage(String path,XFile image) async{
     try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }


  Future<String> supuploadImage(String path, XFile image) async {
  try {
   // Upload Image to Supabase Storage
       final imageExtension = image.path.split('.').last.toLowerCase();
            final imageBytes = await image.readAsBytes();
            final userId = supabase.auth.currentUser!.id;
            final imagePath = '/$userId/profile';
            await supabase.storage.from('profiles').uploadBinary(
                  imagePath,
                  imageBytes,
                  fileOptions: FileOptions(
                    upsert: true,
                    contentType: 'image/$imageExtension',
                  ),
                );
            String imageUrl =
                supabase.storage.from('profiles').getPublicUrl(imagePath);
            imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
              't': DateTime.now().millisecondsSinceEpoch.toString()
            }).toString();
            return imageUrl;
  } catch (e) {
    // Handle errors by providing more information
    if (e is Exception) {
      return 'Error: ${e.toString()}';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }
}

}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ousa_app/data/repositories/categories/firebase_storage_service.dart';
import 'package:ousa_app/features/shop/models/category_model.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // Get all categories

  Future<List<CategoryModel>> getAllCategories() async{
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (_) {
      throw 'Cannot get all categories ';
    }
  }


  // Get sub categories


  // Uploat Categories to the cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    // Upload all the categories along with their Images
    final storage = Get.put(TFirebaseStorageService());
    try {
            // loop through each category
      for(var category in categories){
        // get Image link from local assent
        final file = await storage.getImageDataFromAssets(category.image);

        // upload Image and get its Url
        final url = await storage.uploadImageData("Categories", file, category.name);

        // Assign Url to category.image attribute
        category.image = url;

        // Store category in Firebase
        await _db.collection("Categories").doc(category.id).set(category.toJson());
        
     }
    } on FirebaseException catch (e) {
      throw 'Something went wrong. please try again : $e';
    }
    
  }
}
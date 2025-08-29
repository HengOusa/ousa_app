
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ousa_app/data/repositories/categories/firebase_storage_service.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/utils/constants/enums.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  // Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  // Get Limited features products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  // Get Limited features products
  Future<List<ProductModel>> getAllFeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).get();
      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }
  // Get Limited features products
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList  = querySnapshot.docs.map((doc)=>ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  // Upload dummy data to the Cloud Firebase

  Future<void> uploadDummyData(List<ProductModel> products) async{

    try {
      // Upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each product
      for(var product in products){
        // Get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Upload Url to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if(product.images != null && product.images!.isNotEmpty ){
          List<String> imageUrl = [];
          for(var image in product.images!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its Url
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // Upload Variations Images
        if(product.productType == ProductType.variable.toString()){
          for(var variation in product.productVariations!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its Url
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);


            // Assign Url to variation.image attribute
            variation.image = url;
          }
        }
        // Store Product in Firebase
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
      
    } catch (e) {
      throw e.toString();
    }
  }
}




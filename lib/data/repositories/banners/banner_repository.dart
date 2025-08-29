import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ousa_app/features/shop/models/banner_model.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();


  // Variables
  final _db = FirebaseFirestore.instance;


  // Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async{
    try {
      final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch (_) {
      throw 'Cannot get all categories ';
    }
  }
}